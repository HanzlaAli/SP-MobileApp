part of 'serviceProvider_availability_bloc.dart';

abstract class ServiceProviderAvailabilityEvent {}

class CreateServiceProviderAvailabilityEvent extends ServiceProviderAvailabilityEvent {
  CreateServiceProviderAvailabilityModel? model;
  CreateServiceProviderAvailabilityEvent({this.model});
}

class UpdateServiceProviderAvailabilityEvent extends ServiceProviderAvailabilityEvent {
  UpdateServiceProviderAvailabilityModel? model;
  UpdateServiceProviderAvailabilityEvent({this.model});
}

class DeleteServiceProviderAvailabilityEvent extends ServiceProviderAvailabilityEvent {
  int? id;
  DeleteServiceProviderAvailabilityEvent({this.id});
}

class GetServiceProviderAvailabilityEvent extends ServiceProviderAvailabilityEvent {}
