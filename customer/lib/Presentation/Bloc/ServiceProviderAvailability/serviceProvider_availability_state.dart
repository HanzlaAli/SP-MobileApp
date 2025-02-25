part of 'serviceProvider_availability_bloc.dart';

abstract class ServiceProviderAvailabilityState {}

class ServiceProviderAvailabilityInitial extends ServiceProviderAvailabilityState {}

class ServiceProviderAvailabilityLoading extends ServiceProviderAvailabilityState {}

class ServiceProviderAvailabilityLoaded extends ServiceProviderAvailabilityState {
  List<ServiceProviderAvailabilityModel>? list;
  ServiceProviderAvailabilityLoaded({this.list});
}

class ServiceProviderAvailabilityError extends ServiceProviderAvailabilityState {
  ErrorModel? model;
  ServiceProviderAvailabilityError({this.model});
}
