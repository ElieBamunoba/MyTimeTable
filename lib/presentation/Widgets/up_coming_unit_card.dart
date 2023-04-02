import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/saved_units/saved_units_bloc.dart';
import '../../models/unit_model.dart';
import '/constants/colors.dart';

class UpcomingUnitCard extends StatefulWidget {
  const UpcomingUnitCard({
    Key? key,
    required this.unit,
  }) : super(key: key);
  final UnitModel unit;

  @override
  State<UpcomingUnitCard> createState() => _UpcomingUnitCardState();
}

class _UpcomingUnitCardState extends State<UpcomingUnitCard> {
  String message = "";

  String formatTime(int time, String singular, String plural) {
    if (time == 1) {
      return "${NumberFormat().format(time)} $singular";
    } else {
      return "${NumberFormat().format(time)} $plural";
    }
  }

  void startTimer() {
    final date = widget.unit?.date ?? '0000 00/00/00';
    final time = widget.unit?.time ?? '00:00AM-00:00AM';
    DateTime startTime = DateFormat('dd/MM/yy hh:mma')
        .parse('${date.split(" ")[1]} ${time.split('-')[0]}');
    // Calculate the difference between the start time and the current time
    Duration difference = startTime.difference(DateTime.now());

    // If the start time is in the past, set the duration to 0
    if (difference.isNegative) {
      difference = Duration(seconds: 0);
    }

    // Create a stream that emits a value every second
    Stream<int> stream = Stream.periodic(Duration(seconds: 1), (int count) {
      setState(() {});
      message = "";
      return count;
    });

    // Declare the subscription variable
    StreamSubscription? subscription;

    // Listen to the stream and execute some code every time a value is emitted
    subscription = stream.listen((int count) {
      Duration remaining = difference - Duration(seconds: count);

      if (remaining.isNegative) {
        // If the remaining time is negative, cancel the subscription
        subscription!.cancel();
      } else {
        int days = remaining.inDays;
        int hours = remaining.inHours % 24;
        int minutes = remaining.inMinutes % 60;
        int seconds = remaining.inSeconds % 60;

        if (remaining.inDays >= 1) {
          message += formatTime(days, "day", "days");
          if (hours > 0) {
            message +=
                " ${formatTime(hours, "hour", "hours")} ${formatTime(minutes, "minute", "minutes")}";
          }
        } else if (remaining.inHours >= 1) {
          message += formatTime(hours, "hour", "hours");
          if (minutes > 0) {
            message += " ${formatTime(minutes, "minute", "minutes")} ";
          }
        } else {
          message += formatTime(minutes, "minute", "minutes");
          if (seconds > 0) {
            message += " ${formatTime(seconds, "second", "seconds")}";
          }
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    print("heyyyyyyyyyyyyyyyyyyyyyy");
    startTimer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: AppColors.ligthGreen),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
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
                Text(widget.unit.courseCode.toString()),
                Text(widget.unit.time.toString()),
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
                        Text(widget.unit.date.toString()),
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
                        Text(widget.unit.venue.toString()),
                      ],
                    ),
                  ],
                ),
                Text("$message remaining"),
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            width: 60,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(15),
                )),
            child: IconButton(
              icon: const Icon(Icons.delete_forever,
                  color: Colors.white, size: 25),
              onPressed: () {
                context
                    .read<SavedUnitsBloc>()
                    .add(DeleteUnit(unit: widget.unit));
                context.read<SavedUnitsBloc>().add(LoadSavedUnits());
              },
            ),
          )
        ],
      ),
    );
  }
}
