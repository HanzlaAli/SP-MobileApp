part of 'changePassword_bloc.dart';

abstract class ChangePasswordEventBase {}

class ChangePasswordEvent extends ChangePasswordEventBase {
  ChangePasswordModel changePasswordModel;
  ChangePasswordEvent({required this.changePasswordModel});
}
