// ignore_for_file: body_might_complete_normally_nullable

import 'package:exam_time_table/models/unit_model.dart';

abstract class BaseSavedUnitsRepository {
  Future<void> saveUnit({required UnitModel unit}) async {}
  Future<void> updateUnit({required UnitModel unit}) async {}
  Future<void> deleteUnit({required UnitModel unit}) async {}
  Future<List<UnitModel>?> loadSavedUnits() async {}
}
