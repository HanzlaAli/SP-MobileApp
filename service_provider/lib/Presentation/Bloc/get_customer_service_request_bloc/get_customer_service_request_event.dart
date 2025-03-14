part of 'get_customer_service_request_bloc.dart';

sealed class GetCustomerServiceRequestEvent {}

class GetAllCustomerServiceRequestByCustomerEvent
    extends GetCustomerServiceRequestEvent {
  String? filter;
  int? serviceTypeId;
  GetAllCustomerServiceRequestByCustomerEvent(
      {this.filter, this.serviceTypeId});
}
