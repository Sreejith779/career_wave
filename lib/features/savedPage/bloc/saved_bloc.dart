import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:job_portel/model/dataModel.dart';
import 'package:job_portel/model/savedList.dart';
import 'package:job_portel/model/savedModel.dart';
import 'package:meta/meta.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitial()) {
    on<SaveInitialEvent>(saveInitialEvent);
  }

  FutureOr<void> saveInitialEvent(
      SaveInitialEvent event, Emitter<SavedState> emit) async {
    emit(SavedLoadingState());
    try{
      QuerySnapshot savedJobSnapshot =
      await FirebaseFirestore.instance.collection("SavedJob").get();
      savedList.addAll(savedJobSnapshot.docs
          .map((e) => SavedModel(
          title: e["job role"],
          description: e["description"],
          company: e["company"],
          location: e["location"],
          salary: e["salary"],
          workType: e["workType"],
          imageUrl: e["Logo"],
           ))
          .toList());
      emit(SavedLoadedState(savedList: savedList));
    }catch(e){
      print(e.toString());
      emit(SaverErrorState());
    }


  }
}
