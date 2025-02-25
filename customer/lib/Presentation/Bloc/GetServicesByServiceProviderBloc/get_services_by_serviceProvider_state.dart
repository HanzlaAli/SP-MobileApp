part of 'get_services_by_serviceProvider_bloc.dart';

abstract class GetServicesByServiceProviderStateBase {}

class GetServicesByServiceProviderInitial extends GetServicesByServiceProviderStateBase {}

class GetServicesByServiceProviderLoading extends GetServicesByServiceProviderStateBase {}

class GetServicesByServiceProviderLoaded extends GetServicesByServiceProviderStateBase {
  List<GetAllServiceModel>? model;
  GetServicesByServiceProviderLoaded({this.model});
}

class GetServicesByServiceProviderError extends GetServicesByServiceProviderStateBase {}
