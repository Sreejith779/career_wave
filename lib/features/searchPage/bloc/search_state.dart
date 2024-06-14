part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

  class SearchInitial extends SearchState {}

class SearchLoadedState extends SearchState{
  final List<DbModel>data;

  SearchLoadedState({required this.data});
}
