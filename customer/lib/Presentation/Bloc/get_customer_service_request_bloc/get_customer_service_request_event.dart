part of 'get_customer_service_request_bloc.dart';

sealed class GetCustomerServiceRequestEvent {}

class GetAllCustomerServiceRequestByCustomerEvent extends GetCustomerServiceRequestEvent {
  String? filter;
  GetAllCustomerServiceRequestByCustomerEvent({this.filter});
}
