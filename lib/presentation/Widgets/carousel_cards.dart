import 'package:exam_time_table/models/unit_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'count_down_card.dart';
import 'up-comming_unit_card.dart';

class UnitCardCArouselSlider extends StatelessWidget {
  final UnitModel unit;
  const UnitCardCArouselSlider({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * .23,
        pauseAutoPlayInFiniteScroll: true,
        pauseAutoPlayOnManualNavigate: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlay: true,
      ),
      items: [
        UpcomingUnitCard(unit: unit),
        CountDownCard(unit: unit),
      ],
    );
  }
}
