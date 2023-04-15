import 'package:flutter/material.dart';

//to remove the scrolling glow on a scrollable widgets (Listviews,...)
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
