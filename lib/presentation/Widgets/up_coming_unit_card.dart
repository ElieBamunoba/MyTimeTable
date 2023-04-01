import 'package:exam_time_table/presentation/Widgets/Widgets.dart';
import 'package:flutter/material.dart';

import '/constants/colors.dart';

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
          height: MediaQuery.of(context).size.height * 0.2,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkBlue.withOpacity(0.4),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              TitleText(text: unitCode,fontSize: 26),

              TitleText(text: examTime,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: AppColors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 10),
          TitleText(text: examDay,),

                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.green,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      TitleText(text: examVenue,),


                    ],
                  ),
                ],
              ),
              TitleText(text: "Countdown: 13hrs",color: AppColors.green,fontSize: 20,)

            ],

          ),
        ),
      ),
    );
    ;
    ;

  }
}
