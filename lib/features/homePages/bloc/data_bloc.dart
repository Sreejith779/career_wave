import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portel/model/courseModel.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataInitialLoadingState>(dataInitialLoadingState);
  }
  FutureOr<void> dataInitialLoadingState(
      DataInitialLoadingState event, Emitter<DataState> emit) async {
    emit(DataLoadingState());
    await Future.delayed(Duration(seconds: 2));
    List<CourseModel>courseData = [];
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("courses").get();
      courseData.addAll(querySnapshot.docs.map((e) => CourseModel(title: e['title'], subTitle: e['subTitle'], webUrl: e['website'], image: e['image'])).toList());
      print(courseData);

      emit(DataLoadedState(courseData: courseData));


  }
}
