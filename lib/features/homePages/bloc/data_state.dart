part of 'data_bloc.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoadingState extends DataState {}

class DataLoadedState extends DataState {
  List<DbModel>? jobData;
  final List<CourseModel> courseData;

  DataLoadedState({this.jobData, required this.courseData});
}

class DataErrorState extends DataState {}

class DataSaveState extends DataState {}
