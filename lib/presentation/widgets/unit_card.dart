import 'package:flutter/material.dart';

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
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.darkBlue),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * .1,
        padding: const EdgeInsets.all(10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                unitCode,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Date: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(examDay),
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(examVenue),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    'Time: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(examTime),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
