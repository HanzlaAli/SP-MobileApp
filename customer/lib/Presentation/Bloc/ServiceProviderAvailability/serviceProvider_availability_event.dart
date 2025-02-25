part of 'serviceProvider_availability_bloc.dart';

abstract class ServiceProviderAvailabilityEvent {}

class GetServiceProviderAvailabilityEvent extends ServiceProviderAvailabilityEvent {
  int serviceProviderId, weekDay;
  GetServiceProviderAvailabilityEvent({required this.serviceProviderId, required this.weekDay});
}
