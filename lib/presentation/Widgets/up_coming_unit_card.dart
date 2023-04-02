import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/saved_units/saved_units_bloc.dart';
import '../../models/unit_model.dart';
import '/constants/colors.dart';

class UpcomingUnitCard extends StatelessWidget {
  const UpcomingUnitCard({
    super.key,
    required this.unit,
  });
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.ligthGreen),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            padding: const EdgeInsets.all(24),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(unit.courseCode.toString()),
                Text(unit.time.toString()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: AppColors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(unit.date.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.green,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(unit.venue.toString()),
                      ],
                    ),
                  ],
                ),
                const Text("Countdown: 13hrs"),
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 60,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(15),
                )),
            child: IconButton(
              icon: const Icon(Icons.delete_forever,
                  color: Colors.white, size: 25),
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
