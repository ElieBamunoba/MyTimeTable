import 'package:exam_time_table/constants/colors.dart';
import 'package:exam_time_table/presentation/widgets/search_box.dart';
import 'package:exam_time_table/presentation/widgets/unit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/unit/unit_bloc.dart';
import 'custom_loading.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchBox(),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * .42,
            child: Center(
              child: BlocBuilder<UnitBloc, UnitState>(
                builder: (context, state) {
                  if (state is UnitLoading) {
                    return Builder(builder: (context) {
                      return const CustomLoading();
                    });
                  } else if (state is UnitLoaded) {
                    return state.unitsList.isEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'No results found',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'We couldn\'t find what you searched for.\nTry searching again.\n',
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              SvgPicture.asset("assets/nodata.svg",
                                  height: 130),
                            ],
                          )
                        : ListView.builder(
                            itemCount: state.unitsList.length,
                            itemBuilder: (context, index) =>
                                UnitCard(unit: state.unitsList[index]),
                          );
                  } else if (state is UnitInitial) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Center(
                        child: Text(
                          'Enter your unit code to get a simplified timetable of your exams',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.textColor, fontSize: 15),
                        ),
                      ),
                    );
                  } else if (state is UnitLoadLoadingError) {
                    if (state.errorMessage.split(':').first ==
                        'Failed host lookup') {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height - 200,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Check your Network, \nLooks like your offline",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Icon(
                                  Icons.wifi_off,
                                  size: 60,
                                  color: Colors.grey,
                                )
                              ]),
                        ),
                      );
                    }
                    return Center(
                      child: Text(state.errorMessage.split(':').first),
                    );
                  } else {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
