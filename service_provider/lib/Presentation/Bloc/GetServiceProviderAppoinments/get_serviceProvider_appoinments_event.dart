part of 'get_serviceProvider_appoinments_bloc.dart';

abstract class GetServiceProviderAppoinmentsEventBase {}

class GetServiceProviderAppoinments extends GetServiceProviderAppoinmentsEventBase {
  GetBookedAppoinmentRequestModel? model;
  GetServiceProviderAppoinments({this.model});
}
