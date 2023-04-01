import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/constants/colors.dart';

class UnitCard extends StatelessWidget {
  const UnitCard(
      {super.key,
      required this.unitCode,
      required this.examDay,
      required this.examTime,
      required this.examVenue});
  final String unitCode;
  final String examDay;
  final String examTime;
  final String examVenue;

  @override
  Widget build(BuildContext context) {
    // Convert string to DateTime object
    final date = (examDay.trim()).split(' ');
    String datePart = date[1]; // "17/04/23"

    return Card(
      elevation: 0,
      color: AppColors.ligthBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.ligthBlue),
      ),
      child: Container(
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
                  unitCode,
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
                      examVenue,
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
                      examTime,
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
    );
  }
}
