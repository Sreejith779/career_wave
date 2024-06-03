part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

  class HomeInitial extends HomeState {}

class HomeLoadedState extends HomeState{}
