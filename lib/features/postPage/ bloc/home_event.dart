part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomePostJobEvent extends HomeEvent {
  final String role;
  final String cName;
  final String cLocation;
  final String cWorkType;
  final String skill;
  final String cSalary;
  final String cDescription;
  final Uint8List image;

  HomePostJobEvent(
      {required this.role,
      required this.cName,
      required this.cLocation,
      required this.cWorkType,
      required this.skill,
      required this.cSalary,
      required this.cDescription,
      required this.image});
}
