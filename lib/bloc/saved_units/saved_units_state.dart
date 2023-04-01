part of 'saved_units_bloc.dart';

abstract class SavedUnitsState extends Equatable {
  const SavedUnitsState();

  @override
  List<Object> get props => [];
}

class SavedUnitsInitial extends SavedUnitsState {}

class SavedUnitsLoading extends SavedUnitsState {}

class SavedUnitsLoaded extends SavedUnitsState {
  final List<UnitModel> savedUnitsList;

  const SavedUnitsLoaded({required this.savedUnitsList});

  @override
  List<Object> get props => [];
}

class SavedUnitsLoadingError extends SavedUnitsState {
  final String errorMessage;

  const SavedUnitsLoadingError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
