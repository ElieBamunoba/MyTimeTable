part of 'unit_bloc.dart';

abstract class UnitState extends Equatable {
  const UnitState();
  @override
  List<Object> get props => [];
}

class UnitLoading extends UnitState {}

class UnitInitial extends UnitState {}

class UnitLoaded extends UnitState {
  final List<UnitModel> unitsList;

  const UnitLoaded({required this.unitsList});
  @override
  List<Object> get props => [unitsList];
}

class UnitLoadLoadingError extends UnitState {
  final String errorMessage;

  const UnitLoadLoadingError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
