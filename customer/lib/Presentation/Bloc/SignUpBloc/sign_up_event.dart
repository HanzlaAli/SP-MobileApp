// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class NewUserAccount extends SignUpEvent {
  SignUpModel? signUpModel;
  SetUpCustomerProfileModel? setUpCustomerProfileModel;
  NewUserAccount({this.signUpModel, this.setUpCustomerProfileModel});
}
