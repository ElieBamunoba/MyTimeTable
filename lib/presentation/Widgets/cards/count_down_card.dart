// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

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
          height: size.height * .23,
          width: double.infinity,
          color: AppColors.darkBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Are you ready for exam ?',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //day
                    CountCard(
                      a: format(days)[0].toString(),
                      b: format(days)[1].toString(),
                      lable: 'Days',
                    ),
                    //hours
                    CountCard(
                      a: format(hours)[0].toString(),
                      b: format(hours)[1].toString(),
                      lable: 'Hours',
                    ),
                    //minutes
                    CountCard(
                      a: format(minutes)[0].toString(),
                      b: format(minutes)[1].toString(),
                      lable: 'Minutes',
                    )
                  ],
                ),
              ),
              const SizedBox()
            ],
          ),
        ));
  }
}

class CountCard extends StatelessWidget {
  const CountCard({
    super.key,
    required this.a,
    required this.b,
    required this.lable,
  });
  final String a, b, lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 65,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.darkBlue2,
              ),
              child: Text(
                a,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              height: 65,
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.darkBlue2,
              ),
              child: Text(
                b,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Text(
          lable,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
