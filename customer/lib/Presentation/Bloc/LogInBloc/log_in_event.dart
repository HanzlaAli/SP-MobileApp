// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();

  @override
  List<Object> get props => [];
}

class ServiceProviderAuth extends LogInEvent {
  LogInModel? logInModel;
  ServiceProviderAuth({this.logInModel});
}
