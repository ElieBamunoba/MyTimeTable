import 'package:exam_time_table/presentation/Widgets/scroll_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/saved_units/saved_units_bloc.dart';
import '../constants/colors.dart';
import 'Widgets/cards/carousel_cards.dart';
import 'Widgets/cards/unit_card.dart';
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
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppColors.backgroundLigthGrey,
          title: const Text(
            'My TimeTable',
            style: TextStyle(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_important_outlined,
                    color: AppColors.darkBlue))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  Text('Welcome Friend! 😉',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor)),
                  SizedBox(height: 10),
                  SearchUnitButton(),
                  SizedBox(height: 20),
                ],
              ),
            ),
            BlocBuilder<SavedUnitsBloc, SavedUnitsState>(
              builder: (context, state) {
                if (state is SavedUnitsLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                } else if (state is SavedUnitsLoaded) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        state.savedUnitsList.isNotEmpty
                            ? UnitCardCarouselSlider(
                                unit: state.savedUnitsList[0])
                            : const EmptyUnitsList(),
                        const SizedBox(height: 10),
                        if (state.savedUnitsList.isNotEmpty)
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                itemCount: state.savedUnitsList.length,
                                itemBuilder: (context, index) => Visibility(
                                  visible: index != 0,
                                  child: UnitCard(
                                    key: ValueKey(
                                        state.savedUnitsList[index].courseCode),
                                    unit: state.savedUnitsList[index],
                                    isSaved: true,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
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
        ));
  }
}
