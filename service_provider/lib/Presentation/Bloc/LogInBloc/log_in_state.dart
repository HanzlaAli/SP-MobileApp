// ignore_for_file: must_be_immutable

part of 'log_in_bloc.dart';

abstract class LogInState extends Equatable {
  const LogInState();

  @override
  List<Object> get props => [];
}

class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {
  SuccessModel? successModel;
  LogInSuccess({this.successModel});
}

class LogInError extends LogInState {
  ErrorModel? errorModel;
  LogInError({this.errorModel});
}
