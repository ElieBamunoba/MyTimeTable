import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/models/unit_model.dart';
import '../../../repository/unit/unit_repository.dart';

part 'unit_event.dart';
part 'unit_state.dart';

class UnitBloc extends Bloc<UnitEvent, UnitState> {
  final UnitRepository _unitRepository;
  UnitBloc({required UnitRepository unitRepository})
      : _unitRepository = unitRepository,
        super(UnitInitial()) {
    on<LoadUnits>(_onLoadUnits);
  }
  void _onLoadUnits(LoadUnits event, Emitter emit) async {
    emit(UnitLoading());
    try {
      final List<UnitModel> units = await _unitRepository.fetchUnits(
          units: event.courses, campusId: event.campusId);
      emit(UnitLoaded(unitsList: units));
    } catch (error) {
      //only take the message and not the exception from the server.
      final errorMessage = error.toString().split(':')[1];
      emit(UnitLoadLoadingError(errorMessage: errorMessage));
    }
  }
}
