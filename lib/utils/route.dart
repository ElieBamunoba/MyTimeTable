import 'package:exam_time_table/presentation/landing_screen.dart';
import 'package:flutter/material.dart';

const String landingScreen = 'landingScreen';
Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingScreen:
      return MaterialPageRoute(builder: (context) => const LandingScreen());
    default:
      throw ('This route name does not exist yet');
  }
}
