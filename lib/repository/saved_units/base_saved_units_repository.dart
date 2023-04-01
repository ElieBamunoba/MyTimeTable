import 'package:exam_time_table/models/unit_model.dart';

abstract class BaseSavedUnitsRepository {
  Future<void> saveUnit({required UnitModel unit}) async {}
  Future<void> unitDelete({required UnitModel unit}) async {}
  Future<List<UnitModel>?> loadSavedUnits() async {}
}
