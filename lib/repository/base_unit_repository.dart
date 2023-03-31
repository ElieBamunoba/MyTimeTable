// ignore_for_file: body_might_complete_normally_nullable

import '/models/unit_model.dart';

abstract class BaseUnitRepository {
  Future<List<UnitModel>?> loadUnits(
      {required String units, String campus = "0"}) async {}
}
