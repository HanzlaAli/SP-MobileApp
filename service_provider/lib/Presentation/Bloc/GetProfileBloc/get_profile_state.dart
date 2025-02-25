part of 'get_profile_bloc.dart';

abstract class GetProfileStateBase {}

class GetProfileInitial extends GetProfileStateBase {}

class GetProfileLoading extends GetProfileStateBase {}

class GetProfileLoaded extends GetProfileStateBase {
  ServiceProviderProfileModel? serviceProviderProfileModel;
  GetProfileLoaded({this.serviceProviderProfileModel});
}

class GetProfileError extends GetProfileStateBase {
  ErrorModel? errorModel;
  GetProfileError({this.errorModel});
}
