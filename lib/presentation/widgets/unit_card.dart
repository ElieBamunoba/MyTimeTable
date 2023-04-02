import 'package:exam_time_table/bloc/saved_units/saved_units_bloc.dart';
import 'package:exam_time_table/models/unit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '/constants/colors.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({
    super.key,
    required this.unit,
  });
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    // Convert string to DateTime object
    final date = (unit.date.toString().trim()).split(' ');
    String datePart = date[1]; // "17/04/23"

    return Card(
      elevation: 0,
      color: AppColors.ligthBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.ligthBlue),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      unit.courseCode.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Date: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkGrey),
                        ),
                        Text(
                          DateFormat('EEE dd/MM/yy')
                              .format(DateFormat('dd/MM/yy').parse(datePart)),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Venue: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkGrey),
                        ),
                        Text(
                          unit.venue.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Time: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkGrey),
                        ),
                        Text(
                          unit.time.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<SavedUnitsBloc>().add(SaveUnit(unit: unit));
              context.read<SavedUnitsBloc>().add(LoadSavedUnits());
            },
            icon: const Icon(
              Icons.save_alt_outlined,
              color: AppColors.green,
            ),
          )
        ],
      ),
    );
  }
}

class SavedUnitCard extends StatelessWidget {
  const SavedUnitCard({
    super.key,
    required this.unit,
  });
  final UnitModel unit;

  @override
  Widget build(BuildContext context) {
    // Convert string to DateTime object
    final date = (unit.date.toString().trim()).split(' ');
    String datePart = date[1]; // "17/04/23"
    return Card(
      elevation: 0,
      color: AppColors.ligthBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.ligthBlue),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      unit.courseCode.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                          fontSize: 17),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Date: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkGrey),
                        ),
                        Text(
                          DateFormat('EEE dd/MM/yy')
                              .format(DateFormat('dd/MM/yy').parse(datePart)),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Venue: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkGrey),
                        ),
                        Text(
                          unit.venue.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text(
                          'Time: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDarkGrey),
                        ),
                        Text(
                          unit.time.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBlue),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<SavedUnitsBloc>().add(DeleteUnit(unit: unit));
              context.read<SavedUnitsBloc>().add(LoadSavedUnits());
            },
            icon: const Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
