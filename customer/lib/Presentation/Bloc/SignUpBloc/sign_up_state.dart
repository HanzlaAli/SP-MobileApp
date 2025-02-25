// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  SuccessModel? successModel;
  SignUpSuccess({this.successModel});
}

class SignUpError extends SignUpState {
  ErrorModel? errorModel;
  SignUpError({this.errorModel});
}
