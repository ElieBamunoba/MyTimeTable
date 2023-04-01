import 'package:exam_time_table/presentation/widgets/scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/unit/unit_bloc.dart';
import '../constants/colors.dart';
import './widgets/search_box.dart';
import './widgets/title_text.dart';
import 'Widgets/up_coming_unit_card.dart';
import 'widgets/custom_loading.dart';
import 'widgets/unit_card.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundLigthGrey,
        appBar: AppBar(
          title: const Text('My TimeTable'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_important_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_sharp),
            )
          ],
        ),
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 60,
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleText(
                      text: 'Welcome Freind !',
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                  const SizedBox(height: 10),
                  SearchBox(),
                  const SizedBox(height: 10),
                  BlocBuilder<UnitBloc, UnitState>(
                    builder: (context, state) {
                      if (state is UnitLoading) {
                        return Builder(builder: (context) {
                          return const CustomLoading();
                        });
                      } else if (state is UnitLoaded) {
                        return Expanded(
                          child: Column(
                            children: [
                              UpcomingUnitCard(
                                unitCode:
                                    state.unitsList[0].courseCode.toString(),
                                examDay: state.unitsList[0].date.toString(),
                                examTime: state.unitsList[0].time.toString(),
                                examVenue: state.unitsList[0].venue.toString(),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: state.unitsList.length,
                                  itemBuilder: (context, index) => UnitCard(
                                    unitCode: state.unitsList[index].courseCode
                                        .toString(),
                                    examDay:
                                        state.unitsList[index].date.toString(),
                                    examTime:
                                        state.unitsList[index].time.toString(),
                                    examVenue:
                                        state.unitsList[index].venue.toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is UnitInitial) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * .5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Enter your unit code to get a simplified timetable of your exams',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('Something went wrong'),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
