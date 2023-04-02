import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/saved_units/saved_units_bloc.dart';
import '../../models/unit_model.dart';
import '/constants/colors.dart';

class UpcomingUnitCard extends StatelessWidget {
  const UpcomingUnitCard({
    Key? key,
    required this.unit,
  }) : super(key: key);
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: AppColors.ligthGreen,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.22 + 6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.darkBlue.withOpacity(0.4),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: ListView(
              children: [
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: AppColors.orange.withOpacity(.8)),
                  child: Text(
                    'Upcoming Exam',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 17,
                          wordSpacing: 5,
                          letterSpacing: 2,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unit.courseCode.toString(),
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 25),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                unit.date.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.textDarkGrey,
                                      letterSpacing: 1,
                                    ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.calendar_month_sharp,
                                      color: AppColors.orange, size: 35),
                                  const SizedBox(width: 10),
                                  Text(
                                    unit.time.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: AppColors.textDarkGrey,
                                          letterSpacing: 1,
                                        ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(Icons.location_on_rounded,
                                  color: AppColors.orange, size: 35),
                              const SizedBox(width: 10),
                              Text(
                                unit.venue.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColors.textDarkGrey,
                                      letterSpacing: 1,
                                    ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 50,
            height: 30,
            decoration: const BoxDecoration(
                color: AppColors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(15),
                )),
            child: IconButton(
              icon: const Icon(Icons.delete_forever,
                  color: Colors.white, size: 18),
              onPressed: () {
                context.read<SavedUnitsBloc>().add(DeleteUnit(unit: unit));
                context.read<SavedUnitsBloc>().add(LoadSavedUnits());
              },
            ),
          )
        ],
      ),
    );
  }
}
