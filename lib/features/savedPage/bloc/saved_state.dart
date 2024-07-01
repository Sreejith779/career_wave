part of 'saved_bloc.dart';

@immutable
abstract class SavedState {}

class SavedInitial extends SavedState {}

class SavedLoadingState extends SavedState {}

class SavedLoadedState extends SavedState {
  final List<SavedModel> savedList;

  SavedLoadedState({required this.savedList});
}

class SaverErrorState extends SavedState {}
