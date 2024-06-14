import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_portel/model/dataModel.dart';
import 'package:job_portel/resources/getData.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
  }

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    List<DbModel> data = await fetchData();
    emit(SearchLoadedState(data: data));
  }
}
