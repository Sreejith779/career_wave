import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:job_portel/model/courseModel.dart';
import 'package:job_portel/model/dataModel.dart';
import 'package:job_portel/resources/getData.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataInitial()) {
    on<DataInitialLoadingState>(dataInitialLoadingState);
    on<DataSaveEvent>(dataSaveEvent);
  }
 late List<DbModel> jobData = [];

  FutureOr<void> dataInitialLoadingState(
      DataInitialLoadingState event, Emitter<DataState> emit) async {
    emit(DataLoadingState());

    List<CourseModel> courseData = [];

    try {
      jobData.addAll(await fetchData());

      QuerySnapshot courseSnapshot =
          await FirebaseFirestore.instance.collection("courses").get();
      courseData.addAll(courseSnapshot.docs
          .map((e) => CourseModel(
              title: e['title'],
              subTitle: e['subTitle'],
              webUrl: e['website'],
              image: e['image']))
          .toList());
      print(courseData);

      emit(DataLoadedState(
        jobData: jobData,
        courseData: courseData,
      ));

    } catch (e) {
      emit(DataErrorState());
    }
  }

  FutureOr<void> dataSaveEvent(
      DataSaveEvent event, Emitter<DataState> emit) async {
    final SavesJobs =
        await FirebaseFirestore.instance.collection("SavedJob").add({
      "Logo": event.saveData.imageUrl,
      "job role": event.saveData.title,
      "company": event.saveData.company,
      "description": event.saveData.description,
      "salary": event.saveData.salary,
      "location": event.saveData.skills,
      "workType": event.saveData.workType
    });
    List<CourseModel> courseData = [];
    QuerySnapshot courseSnapshot =
        await FirebaseFirestore.instance.collection("courses").get();
    courseData.addAll(courseSnapshot.docs
        .map((e) => CourseModel(
            title: e['title'],
            subTitle: e['subTitle'],
            webUrl: e['website'],
            image: e['image']))
        .toList());
    emit(DataSaveState());
    emit(DataLoadedState(jobData: jobData,
      courseData: courseData,
    ));
  }
}
