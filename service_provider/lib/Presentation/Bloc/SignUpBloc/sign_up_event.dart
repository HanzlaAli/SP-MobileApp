// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class NewServiceProviderAccount extends SignUpEvent {
  SignUpModel? signUpModel;
  NewServiceProviderAccount({this.signUpModel});
}
