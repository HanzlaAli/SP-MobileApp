part of 'get_services_by_serviceProvider_bloc.dart';

abstract class GetServicesByServiceProviderEventBase {}

class GetServiceProviderServices extends GetServicesByServiceProviderEventBase {
  GetServiceProviderServicesReuqestModel? model;
  GetServiceProviderServices({this.model});
}
