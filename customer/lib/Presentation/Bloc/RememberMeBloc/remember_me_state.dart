part of 'remember_me_bloc.dart';

abstract class RememberMeState {}

class RememberMeInitial extends RememberMeState {}

class RememberMeLoading extends RememberMeState {}

class RememberMeLoaded extends RememberMeState {
  String? email, password;
  RememberMeLoaded({this.email, this.password});
}

class RememberMeError extends RememberMeState {}
