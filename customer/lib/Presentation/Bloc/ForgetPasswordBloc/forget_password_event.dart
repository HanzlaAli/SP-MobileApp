// ignore_for_file: must_be_immutable

part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class RequestForChangePassword extends ForgetPasswordEvent {
  ForgetPasswordModel? forgetPasswordModel;
  RequestForChangePassword({this.forgetPasswordModel});
}

class AddNewPassword extends ForgetPasswordEvent {
  AddNewPasswordModel? addNewPasswordModel;
  AddNewPassword({this.addNewPasswordModel});
}
