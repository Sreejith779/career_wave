part of 'data_bloc.dart';

@immutable
abstract class DataEvent {}

class DataInitialLoadingState extends DataEvent {}

class DataSaveEvent extends DataEvent {
  final DbModel saveData;

  DataSaveEvent({required this.saveData});
}
