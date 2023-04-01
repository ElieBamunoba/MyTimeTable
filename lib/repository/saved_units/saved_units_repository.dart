import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../saved_units/base_saved_units_repository.dart';

import '../../models/unit_model.dart';

class SavedUnitsRepository extends BaseSavedUnitsRepository {
  List<UnitModel> unitsList = [];
  @override
  Future<void> saveUnit({required UnitModel unit}) async {
    unitsList.add(unit);
    final jsonData =
        jsonEncode(unitsList.map((unit) => unit.toJson()).toList());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("data", jsonData);
  }

  @override
  Future<void> unitDelete({required UnitModel unit}) async {
    final prefs = await SharedPreferences.getInstance();
    final unitsList = await loadSavedUnits();
    unitsList.removeWhere((element) => element == unit);
    final jsonData =
        jsonEncode(unitsList.map((unit) => unit.toJson()).toList());
    prefs.setString('data', jsonData);
  }

  @override
  Future<List<UnitModel>> loadSavedUnits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? unitsFromPrefs = prefs.getString("data");
    if (unitsFromPrefs != null) {
      print("here");
      List<dynamic> decodedData = jsonDecode(unitsFromPrefs);
      List<UnitModel> unitsList =
          decodedData.map((unitJson) => UnitModel.fromJson(unitJson)).toList();
      return unitsList;
    } else {
      print("object");
      throw Exception('Data not found');
    }
  }
}
