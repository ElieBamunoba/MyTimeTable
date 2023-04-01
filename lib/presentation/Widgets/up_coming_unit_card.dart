import 'package:flutter/material.dart';

import '/constants/colors.dart';
import './title_text.dart';

class UpcomingUnitCard extends StatelessWidget {
  const UpcomingUnitCard(
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
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.ligthGreen),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {},
        splashColor: AppColors.ligthGreen.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15),
        child: Container(
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
              TitleText(text: unitCode, fontSize: 26),
              TitleText(
                text: examTime,
              ),
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
                      TitleText(
                        text: examDay,
                      ),
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
                      TitleText(
                        text: examVenue,
                      ),
                    ],
                  ),
                ],
              ),
              const TitleText(
                text: "Countdown: 13hrs",
                color: AppColors.green,
                fontSize: 20,
              )
            ],
          ),
        ),
      ),
    );
    ;
    ;
  }
}
