import 'package:exam_time_table/bloc/saved_units/saved_units_bloc.dart';
import 'package:exam_time_table/presentation/widgets/unit_card.dart';
import 'package:exam_time_table/presentation/widgets/up_coming_unit_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';
import 'widgets/empty_units_list.dart';
import 'widgets/search_unit_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SavedUnitsBloc>().add(LoadSavedUnits());
    return Scaffold(
        backgroundColor: AppColors.backgroundLigthGrey,
        appBar: AppBar(
          title: const Text('My TimeTable'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important_outlined))
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 70,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text('Welcome Friend! 😉',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  SizedBox(height: 10),
                  SearchUnitButton(),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<SavedUnitsBloc, SavedUnitsState>(
                builder: (context, state) {
                  if (state is SavedUnitsLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else if (state is SavedUnitsLoaded) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        state.savedUnitsList.isNotEmpty
                            ? UpcomingUnitCard(unit: state.savedUnitsList[0])
                            : const EmptyUnitsList(),
                        if (state.savedUnitsList.isNotEmpty)
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).size.height * 0.55,
                            child: RefreshIndicator(
                              onRefresh: () async {
                                context
                                    .read<SavedUnitsBloc>()
                                    .add(LoadSavedUnits());
                              },
                              child: ListView.builder(
                                  itemCount: state.savedUnitsList.length,
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        ? const SizedBox()
                                        : UnitCard(
                                            unit: state.savedUnitsList[index],
                                            isSaved: true,
                                          );
                                  }),
                            ),
                          ),
                      ],
                    );
                  } else if (state is SavedUnitsLoadingError) {
                    if (state.errorMessage.contains('Data not found')) {
                      return const EmptyUnitsList();
                    } else {
                      return Center(child: Text(state.errorMessage));
                    }
                  } else {
                    return const Center(child: Text('Something Wrong happen'));
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
