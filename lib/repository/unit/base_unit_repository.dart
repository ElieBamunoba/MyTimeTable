// ignore_for_file: body_might_complete_normally_nullable

import '/models/unit_model.dart';

abstract class BaseUnitRepository {
  Future<List<UnitModel>?> fetchUnits(
      {required String units, required String campusId}) async {}
}
