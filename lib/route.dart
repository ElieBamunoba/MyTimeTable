import 'package:exam_time_table/presentation/landing_screen.dart';
import 'package:flutter/material.dart';

const String landingScreen = 'landingScreen';

//control pur page route flow
Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case landingScreen:
      return MaterialPageRoute(builder: (context) => LandingScreen());
    default:
      throw ('This route name does not exist yet');
  }
}
