part of 'saved_units_bloc.dart';

abstract class SavedUnitsEvent extends Equatable {
  const SavedUnitsEvent();

  @override
  List<Object> get props => [];
}

class SaveUnit extends SavedUnitsEvent {
  final UnitModel unit;
  const SaveUnit({required this.unit});
}

class DeleteUnit extends SavedUnitsEvent {
  final UnitModel unit;
  const DeleteUnit({required this.unit});
}

class LoadSavedUnits extends SavedUnitsEvent {}
