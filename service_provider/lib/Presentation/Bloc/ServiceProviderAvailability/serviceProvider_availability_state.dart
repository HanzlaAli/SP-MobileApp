part of 'serviceProvider_availability_bloc.dart';

abstract class ServiceProviderAvailabilityState {}

class ServiceProviderAvailabilityInitial extends ServiceProviderAvailabilityState {}

class ServiceProviderAvailabilityLoading extends ServiceProviderAvailabilityState {}

class ServiceProviderAvailabilityLoaded extends ServiceProviderAvailabilityState {
  List<GetServiceProviderAvailabilityModel>? list;
  ServiceProviderAvailabilityLoaded({this.list});
}

class ServiceProviderAvailabilitySuccess extends ServiceProviderAvailabilityState {
  SuccessModel? model;
  ServiceProviderAvailabilitySuccess({this.model});
}

class ServiceProviderAvailabilityError extends ServiceProviderAvailabilityState {
  ErrorModel? model;
  ServiceProviderAvailabilityError({this.model});
}
