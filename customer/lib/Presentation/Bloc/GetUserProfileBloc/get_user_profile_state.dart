part of 'get_user_profile_bloc.dart';

abstract class GetUserProfileStateBase {}

class GetUserProfileInitial extends GetUserProfileStateBase {}

class GetUserProfileLoading extends GetUserProfileStateBase {}

class GetUserProfileLoaded extends GetUserProfileStateBase {
  CustomerProfileModel? customerProfileModel;
  GetUserProfileLoaded({this.customerProfileModel});
}

class GetUserProfileError extends GetUserProfileStateBase {
  ErrorModel? errorModel;
  GetUserProfileError({this.errorModel});
}
