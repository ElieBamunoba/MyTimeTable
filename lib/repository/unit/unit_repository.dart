// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/unit_model.dart';
import 'base_unit_repository.dart';

class UnitRepository extends BaseUnitRepository {
  @override
  //method to load courses as a list.
  Future<List<UnitModel>> fetchUnits(
      {required String units, required String campusId}) async {
    final response = await http.get(Uri.parse(
        "https://timetable.kimworks.buzz/api/courses?courses=$units&campus_choice=$campusId"));
    List<UnitModel> unitsList = List.empty();
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body)['data'] as List;
      unitsList = jsonData.map((unit) => UnitModel.fromJson(unit)).toList();
      return unitsList;
    } else if (response.statusCode == 404) {
      throw Exception('Not Subcategory found');
    } else {
      throw Exception('Failed to load subcategories');
    }
  }
}
