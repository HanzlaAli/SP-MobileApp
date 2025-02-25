part of 'set_customer_profile_bloc.dart';

abstract class SetCustomerProfileStateBase {}

class SetCustomerProfileInitial extends SetCustomerProfileStateBase {}

class SetCustomerProfileLoading extends SetCustomerProfileStateBase {}

class SetCustomerProfileSuccess extends SetCustomerProfileStateBase {
  SuccessModel? successModel;
  SetCustomerProfileSuccess({this.successModel});
}

class SetCustomerProfileError extends SetCustomerProfileStateBase {
  ErrorModel? errorModel;
  SetCustomerProfileError({this.errorModel});
}
