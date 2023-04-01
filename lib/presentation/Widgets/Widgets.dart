// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:exam_time_table/constants/colors.dart';

// class to customize text widget
class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const TitleText(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = AppColors.textColor,
      this.fontWeight = FontWeight.w800})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.gentiumPlus(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;

  const HeaderText(
      {Key? key,
      required this.text,
      this.fontSize = 20,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w900})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.rubik(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}

class Icon_ extends StatelessWidget {
  final IconData icon;
  final Color color;

  Icon_({
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.none,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
      ),
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}

Widget titleBar() {
  DateTime date = DateTime.now();
  return Container(
    margin: const EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(
              text: DateFormat.yMMMMEEEEd().format(date),
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
            const TitleText(
              text: 'Welcome Freind !',
              fontSize: 19,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ],
    ),
  );
}
