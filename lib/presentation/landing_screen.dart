import 'package:exam_time_table/presentation/Widgets/Widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../presentation/widgets/unit_card.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - 50,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xfffbfbfb),
                  Color(0xfff7f7f7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appBar(),
                  titleBar(),
                  const Expanded(
                      child: AnimatedSwitcher(
                    duration: Duration(
                      milliseconds: 300,
                    ),
                    switchInCurve: Curves.easeInToLinear,
                    switchOutCurve: Curves.easeOutBack,
                    child: MyWidget(),
                  )),
                  const UnitCard(
                    unitCode: "ACS314A",
                    examDay: "FRIDAY 21/04/23",
                    examTime: "11:30PM-1:30PM",
                    examVenue: "BCC 4",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
