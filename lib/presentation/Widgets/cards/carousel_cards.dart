import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../repository/models/unit_model.dart';
import './count_down_card.dart';
import './up-comming_unit_card.dart';

class UnitCardCarouselSlider extends StatefulWidget {
  final UnitModel unit;
  const UnitCardCarouselSlider({super.key, required this.unit});
  @override
  State<UnitCardCarouselSlider> createState() => _UnitCardCarouselSliderState();
}

class _UnitCardCarouselSliderState extends State<UnitCardCarouselSlider> {
  int days = 0, hours = 0, minutes = 0;

  // Declare the subscription variable
  StreamSubscription? subscription;

  //function to compute the countdown
  void startTimer(UnitModel unit) {
    final date = unit.date;
    final time = unit.time;
    DateTime startTime = DateFormat('dd/MM/yy hh:mma').parse(
        '${date!.split(" ")[1]} ${(time!.replaceAll('.', ':')).split('-')[0]}');
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
        setState(() {
          days = remaining.inDays;
          hours = remaining.inHours % 24;
          minutes = remaining.inMinutes % 60;
        });
      }
    });
  }

  @override
  void initState() {
    startTimer(widget.unit);
    super.initState();
  }

  @override
  void didUpdateWidget(UnitCardCarouselSlider oldWidget) {
    if (oldWidget.unit != widget.unit) {
      // If the unit has changed, cancel the current subscription and start a new timer
      subscription?.cancel();
      startTimer(widget.unit);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
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
        autoPlayInterval: const Duration(seconds: 7),
        autoPlay: true,
      ),
      items: [
        UpcomingUnitCard(unit: widget.unit),
        CountDownCard(days: days, hours: hours, minutes: minutes),
      ],
    );
  }
}
