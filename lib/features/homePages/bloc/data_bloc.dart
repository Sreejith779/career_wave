import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataInitialLoadingState>(dataInitialLoadingState);
  }
  FutureOr<void> dataInitialLoadingState(
      DataInitialLoadingState event, Emitter<DataState> emit) async {
    CircularProgressIndicator();
    await Future.delayed(Duration(seconds: 5));
      final data = await FirebaseFirestore.instance.collection("courses").get();
      print(data);
      emit(DataLoadingState());


  }
}
