import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../models/unit_model.dart';
import '../../../repository/unit/unit_repository.dart';
import '/repository/saved_units/saved_units_repository.dart';

part 'saved_units_event.dart';
part 'saved_units_state.dart';

class SavedUnitsBloc extends Bloc<SavedUnitsEvent, SavedUnitsState> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final SavedUnitsRepository _savedUnitsRepository;
  final UnitRepository _unitRepository;
  SavedUnitsBloc(
      {required SavedUnitsRepository savedUnitsRepository,
      required UnitRepository unitRepository})
      : _savedUnitsRepository = savedUnitsRepository,
        _unitRepository = unitRepository,
        super(SavedUnitsInitial()) {
    on<SaveUnit>(_onSaveUnit);
    on<DeleteUnit>(_onDeleteUnit);
    on<LoadSavedUnits>(_onLoadSavedUnits);
    on<UpdateSavedUnits>(_onUpdateSavedUnit);
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

  Future<void> _onUpdateSavedUnit(UpdateSavedUnits event, Emitter emit) async {
    emit(SavedUnitsLoading());
    try {
      //getting the saved unit code and to make a request.
      String unitCodes =
          event.savedUnits.map((unit) => unit.courseCode).join(', ');
      //fetch the latest update
      final List<UnitModel> updatedUnits =
          await _unitRepository.fetchUnits(units: unitCodes, campusId: '0');
      //save the updated units
      for (UnitModel unit in updatedUnits) {
        _savedUnitsRepository.updateUnit(unit: unit);
      }
      final List<UnitModel> unitsList =
          await _savedUnitsRepository.loadSavedUnits();
      emit(SavedUnitsLoaded(savedUnitsList: unitsList));
      Fluttertoast.showToast(msg: '${unitCodes} have been updated');
    } catch (error) {
      emit(SavedUnitsLoadingError(errorMessage: '$error'));
    }
  }

  Future<void> _onDeleteUnit(DeleteUnit event, Emitter emit) async {
    emit(SavedUnitsLoading());
    try {
      _savedUnitsRepository.deleteUnit(unit: event.unit);
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
      //_scheduleNotifications(unitsList);
    } catch (error) {
      emit(SavedUnitsLoadingError(errorMessage: '$error'));
    }
  }
}
