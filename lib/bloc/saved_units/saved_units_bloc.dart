import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../models/unit_model.dart';
import '/repository/saved_units/saved_units_repository.dart';

part 'saved_units_event.dart';
part 'saved_units_state.dart';

class SavedUnitsBloc extends Bloc<SavedUnitsEvent, SavedUnitsState> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

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
      _scheduleNotifications(unitsList);
    } catch (error) {
      emit(SavedUnitsLoadingError(errorMessage: '$error'));
    }
  }
  void _scheduleNotifications(List<UnitModel> unitsList) {
    final now = DateTime.now();
    unitsList.forEach((unit) {
      //
     // final examDateTime = DateTime.parse(unit.date);
      final examDateTime = DateTime(2020);
      final threeHoursBefore = examDateTime.subtract(Duration(hours: 3));
      final oneHourBefore = examDateTime.subtract(Duration(hours: 1));
      final thirtyMinutesBefore = examDateTime.subtract(Duration(minutes: 30));


      if (now.isBefore(threeHoursBefore!)) {
        // Schedule notification 3 hours before exam time
        _scheduleNotification(threeHoursBefore, 'Upcoming exam',
            'Your ${unit.courseCode} exam is coming up in 3 hours');
      }
      if (now.isBefore(oneHourBefore!)) {
        // Schedule notification 1 hour before exam time
        _scheduleNotification(oneHourBefore, 'Upcoming exam',
            'Your ${unit.courseCode} exam is coming up in 1 hour');
      }
      if (now.isBefore(thirtyMinutesBefore!)) {
        // Schedule notification 30 minutes before exam time
        _scheduleNotification(thirtyMinutesBefore, 'Upcoming exam',
            'Your ${unit.courseCode} exam is coming up in 30 minutes');
      }
    });
  }

  void _scheduleNotification(DateTime scheduledDate, String title, String body) {
    // Use the flutter_local_notifications plugin to schedule notifications
    // Make sure to import the necessary packages and initialize the plugin in your main.dart file
    // See the plugin documentation for more information
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_id', 'channel_name',
        importance: Importance.max, priority: Priority.high);
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,);

    flutterLocalNotificationsPlugin.schedule(
        0, title, body, scheduledDate, platformChannelSpecifics);
  }
}