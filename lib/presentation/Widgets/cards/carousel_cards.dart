import 'dart:async';

import 'package:exam_time_table/models/unit_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

import 'count_down_card.dart';
import 'up-comming_unit_card.dart';

class UnitCardCarouselSlider extends StatefulWidget {
  final UnitModel unit;
  UnitCardCarouselSlider({super.key, required this.unit});
  @override
  State<UnitCardCarouselSlider> createState() => _UnitCardCarouselSliderState();
}

class _UnitCardCarouselSliderState extends State<UnitCardCarouselSlider> {
  int days = 0, hours = 0, minutes = 0;

  // Declare the subscription variable
  StreamSubscription? subscription;
  // final UnitModel unit;
  void startTimer() {
    final date = widget.unit.date;
    final time = widget.unit.time;
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
        print('called called 11');
        // If the remaining time is negative, cancel the subscription
        subscription!.cancel();
      } else {
        days = remaining.inDays;
        hours = remaining.inHours % 24;
        minutes = remaining.inMinutes % 60;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * .23,
        pauseAutoPlayInFiniteScroll: true,
        pauseAutoPlayOnManualNavigate: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlay: true,
      ),
      items: [
        UpcomingUnitCard(unit: widget.unit),
        CountDownCard(days: days, hours: hours, minutes: minutes),
      ],
    );
  }
}
