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
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(unitCode),
              Text('Venue: $examVenue'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date: $examDay'),
              Text('Time: $examTime'),
            ],
          ),
        ]),
      ),
    );
  }
}
