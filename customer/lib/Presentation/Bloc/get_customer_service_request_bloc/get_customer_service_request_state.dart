part of 'get_customer_service_request_bloc.dart';

sealed class GetCustomerServiceRequestState {}

final class GetCustomerServiceRequestInitial
    extends GetCustomerServiceRequestState {}

class GetCustomerServiceRequestLoading extends GetCustomerServiceRequestState {}

final class GetCustomerServiceRequestLoaded
    extends GetCustomerServiceRequestState {
  List<CustomerRequestServiceModel> model;
  GetCustomerServiceRequestLoaded({required this.model});
}

final class GetCustomerServiceRequestError
    extends GetCustomerServiceRequestState {
  ErrorModel model;
  GetCustomerServiceRequestError({required this.model});
}
