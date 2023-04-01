import 'package:flutter/material.dart';

import '../presentation/widgets/unit_card.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: const [
          UnitCard(
            unitCode: "ACS314A",
            examDay: "FRIDAY 21/04/23",
            examTime: "11:30PM-1:30PM",
            examVenue: "BCC 4",
          ),
          UnitCard(
            unitCode: "ACS314A",
            examDay: "FRIDAY 21/04/23",
            examTime: "11:30PM-1:30PM",
            examVenue: "BCC 4",
          ),
          UnitCard(
            unitCode: "ACS314A",
            examDay: "FRIDAY 21/04/23",
            examTime: "11:30PM-1:30PM",
            examVenue: "BCC 4",
          )
        ],
      )),
    );
  }
}
