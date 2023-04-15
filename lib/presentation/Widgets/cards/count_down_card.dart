// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import './small_counting_card.dart';

class CountDownCard extends StatelessWidget {
  CountDownCard(
      {super.key,
      required this.days,
      required this.hours,
      required this.minutes});

  final int days;
  final int hours;
  final int minutes;

  String format(int data) {
    String dataAsString = data.toString().padLeft(2, '0');
    return dataAsString;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 15),
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: AppColors.ligthBlue2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.darkBlue)),
        child: Container(
            height: size.height * .21,
            width: double.infinity,
            color: AppColors.darkBlue,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Are you ready for exam ?',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //day
                            SmallCountingCard(
                                a: format(days)[0].toString(),
                                b: format(days)[1].toString(),
                                lable: 'Days'),
                            //hours
                            SmallCountingCard(
                                a: format(hours)[0].toString(),
                                b: format(hours)[1].toString(),
                                lable: 'Hours'),
                            //minutes
                            SmallCountingCard(
                                a: format(minutes)[0].toString(),
                                b: format(minutes)[1].toString(),
                                lable: 'Minutes')
                          ])),
                  const SizedBox()
                ])));
  }
}
