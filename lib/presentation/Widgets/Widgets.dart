import 'package:exam_time_table/constants/colors.dart';
import 'package:exam_time_table/constants/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height - 210,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              customSearch(),
              SizedBox(height: 20,),
              Container(
                  padding: AppConstants.padding,
                  child: const HeaderText(text: "Upcoming exam",),
                  ),



            ],
          ),
        ),
      )
    );


  }




}
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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xfff8f8f8),
            blurRadius: 5,
            spreadRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: 30,
      ),
    );
  }
}
Widget customSearch() {
  return Container(
    margin: AppConstants.padding,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.textLigthGrey.withAlpha(100),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Units",
                  hintStyle: TextStyle(fontSize: 14),
                  contentPadding:
                  EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
                  prefixIcon: Icon(Icons.search, color: Colors.black54)),
            ),
          ),
        ),
        const SizedBox(width: 20),

      ],
    ),
  );
}
Widget appTitle(){
  return Container(
    padding: AppConstants.padding,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(18)),

      border: Border.all(
        color: AppColors.darkBlue,
        width: 1,
      ),
      boxShadow: <BoxShadow>[
        const BoxShadow(
          color: Color(0xfffbf2ef),
          blurRadius: 10,
          spreadRadius: 5,
          offset: Offset(5, 5),
        ),
      ],
    ),
    child: Row(
      children: <Widget>[
        Container(
          child: const TitleText(
            text: 'My TimeTable',
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        )
      ],
    ),
  );
}
Widget appBar(){
  return Container(
    padding:AppConstants.padding,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        appTitle(),
        Container(height: 40,width: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.darkBlue,
              style: BorderStyle.none,

            ),
            borderRadius: BorderRadius.all(Radius.circular(13)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xfff8f8f8),
                  blurRadius: 5,
                  spreadRadius: 10,
                  offset: Offset(5, 5)),
            ],
          ),
          child: Icon(
            Icons.notifications,
            color: Colors.black,
            size: 30,
          ),).ripple(() {},borderRadius: BorderRadius.all(Radius.circular((13))))

      ],
    ),

  );
}
Widget titleBar(){
  DateTime date = new DateTime.now();
  return Container(
    margin: EdgeInsets.all(12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(text: '${DateFormat.yMMMMEEEEd().format(date)}',fontSize: 12,fontWeight: FontWeight.w200,),
            TitleText(text: 'Welcome Student!',fontSize: 19,fontWeight: FontWeight.w700,)
          ],
        ),
      ],
    ),
  );


}


extension OnPressed on Widget {
  Widget ripple(Function onPressed,
          {BorderRadiusGeometry borderRadius =
              const BorderRadius.all(Radius.circular(5))}) =>
      Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: borderRadius),
                )),
                onPressed: () {
                  if (onPressed != null) {
                    onPressed();
                  }
                },
                child: Container()),
          )
        ],
      );
}