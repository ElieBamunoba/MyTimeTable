part of 'saved_units_bloc.dart';

abstract class SavedUnitsEvent extends Equatable {
  const SavedUnitsEvent();

  @override
  List<Object> get props => [];
}

class SaveUnit extends SavedUnitsEvent {
  final UnitModel unit;
  const SaveUnit({required this.unit});
  @override
  List<Object> get props => [unit];
}

class DeleteUnit extends SavedUnitsEvent {
  final UnitModel unit;
  const DeleteUnit({required this.unit});
  @override
  List<Object> get props => [unit];
}

class UpdateSavedUnits extends SavedUnitsEvent {
  final List<UnitModel> savedUnits;
  const UpdateSavedUnits({required this.savedUnits});
  @override
  List<Object> get props => [savedUnits];
}

class LoadSavedUnits extends SavedUnitsEvent {}
