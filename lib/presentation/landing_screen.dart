import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/saved_units/saved_units_bloc.dart';
import '../constants/colors.dart';
import './widgets/unit_card.dart';
import 'widgets/empty_units_list.dart';
import 'widgets/search_unit_button.dart';
import './widgets/carousel_cards.dart';

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
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor)),
                  SizedBox(height: 10),
                  SearchUnitButton(),
                ],
              ),
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
                            ? UnitCardCArouselSlider(
                                unit: state.savedUnitsList[0])
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
