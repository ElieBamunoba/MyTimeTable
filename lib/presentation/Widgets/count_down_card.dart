import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/colors.dart';
import '../../models/unit_model.dart';

class CountDownCard extends StatelessWidget {
  CountDownCard({super.key, required this.unit}) {
    startTimer();
  }
  final UnitModel unit;

  int days = 0;

  int hours = 0;

  int minutes = 0;
  int seconds = 0;
  // Declare the subscription variable
  StreamSubscription? subscription;

  void startTimer() {
    final date = unit.date;
    final time = unit.time;
    DateTime startTime = DateFormat('dd/MM/yy hh:mma')
        .parse('${date!.split(" ")[1]} ${time!.split('-')[0]}');
    // Calculate the difference between the start time and the current time
    Duration difference = startTime.difference(DateTime.now());

    // If the start time is in the past, set the duration to 0
    if (difference.isNegative) {
      difference = const Duration(seconds: 0);
    }
    // Create a stream that emits a value every second
    Stream<int> stream =
        Stream.periodic(const Duration(seconds: 1), (int count) {
      return count;
    });

    // Listen to the stream and execute some code every time a value is emitted
    subscription = stream.listen((int count) {
      Duration remaining = difference - Duration(seconds: count);

      if (remaining.isNegative) {
        // If the remaining time is negative, cancel the subscription
        subscription!.cancel();
      } else {
        setState(() {});
        days = remaining.inDays;
        hours = remaining.inHours % 24;
        minutes = remaining.inMinutes % 60;
        seconds = remaining.inSeconds % 60;
        seconds = remaining.inSeconds % 60;
      }
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  String format(int data) {
    String dataAsString = data.toString().padLeft(2, '0');
    return dataAsString;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      return Card(
          margin: const EdgeInsets.symmetric(vertical: 15),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: AppColors.ligthBlue2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: AppColors.darkBlue)),
          child: Container(
            height: size.height * .2,
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
    });
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
        ),
      ],
    );
  }
}
