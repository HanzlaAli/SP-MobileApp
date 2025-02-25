part of 'changePassword_bloc.dart';

abstract class ChangePasswordStateBase {}

class ChangePasswordInitialState extends ChangePasswordStateBase {}

class ChangePasswordLoadingState extends ChangePasswordStateBase {}

class ChangePasswordSuccessState extends ChangePasswordStateBase {}

class NotChangePasswordenticatedState extends ChangePasswordStateBase {}
