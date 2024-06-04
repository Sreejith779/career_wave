import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../resources/add_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomePostJobEvent>(homePostJobEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {


    emit(HomeLoadedState());
  }

  FutureOr<void> homePostJobEvent(
      HomePostJobEvent event, Emitter<HomeState> emit) {
    void saveJob() async {
      String role = event.role;
      String cName = event.cName;
      String cLocation = event.cLocation;
      String cWorkType = event.cWorkType;
      String skill = event.skill;
      String cSalary = event.cSalary;
      String cDescription = event.cDescription;

      String resp = await StoreData().saveData(
          jobRole: role,
          cName: cName,
          location: cLocation,
          type: cWorkType,
          skills: skill,
          salary: cSalary,
          description: cDescription,
          file: event.image);
    }

    saveJob();
    emit(HomeLoadedState());
  }
}
