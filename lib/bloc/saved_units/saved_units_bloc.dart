import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/unit_model.dart';
import '/repository/saved_units/saved_units_repository.dart';

part 'saved_units_event.dart';
part 'saved_units_state.dart';

class SavedUnitsBloc extends Bloc<SavedUnitsEvent, SavedUnitsState> {
  final SavedUnitsRepository _savedUnitsRepository;
  SavedUnitsBloc({required SavedUnitsRepository savedUnitsRepository})
      : _savedUnitsRepository = savedUnitsRepository,
        super(SavedUnitsInitial()) {
    on<SaveUnit>(_onSaveUnit);
    on<DeleteUnit>(_onDeleteUnit);
    on<LoadSavedUnits>(_onLoadSavedUnits);
  }

  Future<void> _onSaveUnit(SaveUnit event, Emitter emit) async {
    emit(SavedUnitsLoading());
    try {
      _savedUnitsRepository.saveUnit(unit: event.unit);
      final List<UnitModel> unitsList =
          await _savedUnitsRepository.loadSavedUnits();
      emit(SavedUnitsLoaded(savedUnitsList: unitsList));
    } catch (error) {
      emit(SavedUnitsLoadingError(errorMessage: '$error'));
    }
  }

  Future<void> _onDeleteUnit(DeleteUnit event, Emitter emit) async {
    emit(SavedUnitsLoading());
    try {
      _savedUnitsRepository.unitDelete(unit: event.unit);
      final List<UnitModel> unitsList =
          await _savedUnitsRepository.loadSavedUnits();
      emit(SavedUnitsLoaded(savedUnitsList: unitsList));
    } catch (error) {
      emit(SavedUnitsLoadingError(errorMessage: '$error'));
    }
  }

  Future<void> _onLoadSavedUnits(LoadSavedUnits event, Emitter emit) async {
    emit(SavedUnitsLoading());
    try {
      final List<UnitModel> unitsList =
          await _savedUnitsRepository.loadSavedUnits();
      emit(SavedUnitsLoaded(savedUnitsList: unitsList));
    } catch (error) {
      emit(SavedUnitsLoadingError(errorMessage: '$error'));
    }
  }
}
