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
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.ligthGreen),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .20,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(unitCode,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColors.darkBlue, fontWeight: FontWeight.bold)),
            Text(examTime,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Date:",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: AppColors.green)),
                    const SizedBox(width: 10),
                    Text(
                      examDay,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Venue:",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: AppColors.green,
                              ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      examVenue,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
