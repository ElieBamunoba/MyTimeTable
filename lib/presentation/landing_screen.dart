import 'package:exam_time_table/presentation/Widgets/Widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/unit/unit_bloc.dart';
import 'Widgets/custom_app.dart';
import 'Widgets/search_box.dart';
import 'Widgets/up_coming_unit_card.dart';
import 'widgets/unit_card.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            titleBar(),
            SearchBox(),
            BlocBuilder<UnitBloc, UnitState>(
              builder: (context, state) {
                if (state is UnitLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UnitLoaded) {
                  return Expanded(
                    child: Column(
                      children: [

                        const TitleText(text: "Your upcoming exam",fontSize: 20,),
                        UpcomingUnitCard(
                          unitCode: state.unitsList[0].courseCode.toString(),
                          examDay: state.unitsList[0].date.toString(),
                          examTime: state.unitsList[0].time.toString(),
                          examVenue: state.unitsList[0].venue.toString(),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.unitsList.length,
                            itemBuilder: (context, index) => UnitCard(
                              unitCode:
                                  state.unitsList[index].courseCode.toString(),
                              examDay: state.unitsList[index].date.toString(),
                              examTime: state.unitsList[index].time.toString(),
                              examVenue:
                                  state.unitsList[index].venue.toString(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
