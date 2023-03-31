import 'package:flutter/material.dart';
import './constants/theme.dart';
import './route.dart' as route;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyTimeTable',
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        onGenerateRoute: route.onGeneratedRoute,
        initialRoute: route.landingScreen);
  }
}
