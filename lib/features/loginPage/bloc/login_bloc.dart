import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:job_portel/features/loginPage/googleAuth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
  on<LoginInitialLoadedEvent>(loginInitialLoadedEvent);
  on<GoogleLoginEvent>(googleLoginEvent);
  }

  FutureOr<void> loginInitialLoadedEvent(LoginInitialLoadedEvent event, Emitter<LoginState> emit) {
    emit(LoginLoadedState());
  }

  FutureOr<void> googleLoginEvent(GoogleLoginEvent event, Emitter<LoginState> emit) async{

    await FirebaseService().signInWithGoogle();
    emit(LoginLoadedState());
  }
}
