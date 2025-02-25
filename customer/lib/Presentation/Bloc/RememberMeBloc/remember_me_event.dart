part of 'remember_me_bloc.dart';

abstract class RememberMeEvent {}

class RememberMe extends RememberMeEvent {
  String? email, password;
  RememberMe({this.email, this.password});
}

class GetRememberMe extends RememberMeEvent {}
