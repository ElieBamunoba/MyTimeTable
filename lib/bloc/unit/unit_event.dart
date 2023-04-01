part of 'unit_bloc.dart';

abstract class UnitEvent extends Equatable {
  const UnitEvent();
  @override
  List<Object> get props => [];
}

class LoadUnits extends UnitEvent {
  final String courses;
  final String campus;

  const LoadUnits({required this.courses, this.campus = '0'});
  @override
  List<Object> get props => [courses, campus];
}
