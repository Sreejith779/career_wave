import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portel/model/courseModel.dart';
import 'package:job_portel/model/dataModel.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataInitialLoadingState>(dataInitialLoadingState);
    on<DataSaveEvent>(dataSaveEvent);
  }
  FutureOr<void> dataInitialLoadingState(
      DataInitialLoadingState event, Emitter<DataState> emit) async {
    emit(DataLoadingState());

    List<CourseModel>courseData = [];
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("courses").get();
      courseData.addAll(querySnapshot.docs.map((e) => CourseModel(title: e['title'], subTitle: e['subTitle'], webUrl: e['website'], image: e['image'])).toList());
      print(courseData);

      emit(DataLoadedState(courseData: courseData));


  }

  FutureOr<void> dataSaveEvent(DataSaveEvent event, Emitter<DataState> emit) async{

    final SavesJobs = await FirebaseFirestore.instance.collection("SavedJob").add({
      "Logo":event.saveData.imageUrl,
      "job role": event.saveData.title,
      "company": event.saveData.company,
      "description":event.saveData.description,
      "salary":event.saveData.salary,
      "location": event.saveData.skills,
      "workType": event.saveData.workType
    });
    emit(DataLoadedState(courseData: []));
  }
}
