// ignore_for_file: must_be_immutable

part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  SuccessModel? successModel;
  ForgetPasswordSuccess({this.successModel});
}

class ForgetPasswordError extends ForgetPasswordState {
  ErrorModel? errorModel;
  ForgetPasswordError({this.errorModel});
}
