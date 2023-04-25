import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/unit_model.dart';
import '../saved_units/base_saved_units_repository.dart';

class SavedUnitsRepository extends BaseSavedUnitsRepository {
  @override
  //function to add a course in the saved list
  Future<void> saveUnit({required UnitModel unit}) async {
    final prefs = await SharedPreferences.getInstance();
    final unitsList = await loadSavedUnits();

    //check if the course has been already saved
    if (!unitsList.any((element) => element.courseCode == unit.courseCode)) {
      unitsList.add(unit);
      final jsonData =
          jsonEncode(unitsList.map((unit) => unit.toJson()).toList());
      prefs.setString("data", jsonData);
      Fluttertoast.showToast(msg: '${unit.courseCode} has been added');
    } else {
      Fluttertoast.showToast(msg: '${unit.courseCode} already exist');
    }
  } //function to update a course in the saved list

  Future<void> updateUnit({required UnitModel unit}) async {
    final prefs = await SharedPreferences.getInstance();
    final unitsList = await loadSavedUnits();

    //check if the course has been already saved
    if (unitsList.any((element) => element.courseCode == unit.courseCode)) {
      //update the unit by the new unit fetched
      unitsList[unitsList.indexWhere(
          (element) => element.courseCode == unit.courseCode)] = unit;
      final jsonData =
          jsonEncode(unitsList.map((unit) => unit.toJson()).toList());
      prefs.setString("data", jsonData);
    } else {
      Fluttertoast.showToast(msg: 'we couldn\'n update ${unit.courseCode}');
    }
  }

  @override
  //function to delete a course from the list
  Future<void> deleteUnit({required UnitModel unit}) async {
    final prefs = await SharedPreferences.getInstance();
    final unitsList = await loadSavedUnits();
    unitsList.removeWhere((element) => element.courseCode == unit.courseCode);
    final jsonData =
        jsonEncode(unitsList.map((unit) => unit.toJson()).toList());
    prefs.setString("data", jsonData);
    Fluttertoast.showToast(msg: '${unit.courseCode} has been removed');
  }

  @override
  //function to load the courses from the list
  Future<List<UnitModel>> loadSavedUnits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? unitsFromPrefs = prefs.getString("data");
    if (unitsFromPrefs != null) {
      List<dynamic> decodedData = jsonDecode(unitsFromPrefs);
      decodedData.sort((a, b) {
        // Parse day strings into date objects
        DateTime aDate = DateFormat('dd/MM/yy')
            .parse(a['day'].toString().trim().split(' ').elementAt(1));
        DateTime bDate = DateFormat('dd/MM/yy')
            .parse(b['day'].toString().trim().split(' ').elementAt(1));

        // Compare dates first
        int dateComparison = aDate.compareTo(bDate);
        if (dateComparison != 0) {
          return dateComparison;
        }
        // If dates are the same, parse time strings into DateTime objects
        DateTime aTime = DateFormat('hh:mma')
            .parse((a['time'].toString().replaceAll('.', ':')).split('-')[0]);
        DateTime bTime = DateFormat('hh:mma')
            .parse((b['time'].toString().replaceAll('.', ':')).split('-')[0]);

        // Compare times
        return aTime.compareTo(bTime);
      });
      List<UnitModel> unitsList =
          decodedData.map((unitJson) => UnitModel.fromJson(unitJson)).toList();
      return unitsList;
    } else {
      return <UnitModel>[];
    }
  }
}
