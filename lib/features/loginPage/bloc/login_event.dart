part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitialLoadedEvent extends LoginEvent {}

class GoogleLoginEvent extends LoginEvent{}