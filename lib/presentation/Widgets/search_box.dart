// ignore_for_file: must_be_immutable

import 'package:exam_time_table/bloc/unit/unit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/colors.dart';

class SearchBox extends StatelessWidget {
  SearchBox({super.key});
  TextEditingController units = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.textLigthGrey.withAlpha(100),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextField(
        controller: units,
        onSubmitted: (value) => context
            .read<UnitBloc>()
            .add(LoadUnits(courses: value.toUpperCase())),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Search Units",
          hintStyle: TextStyle(fontSize: 14),
          contentPadding:
              EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
          prefixIcon: Icon(Icons.search, color: Colors.black54),
        ),
      ),
    );
  }
}
