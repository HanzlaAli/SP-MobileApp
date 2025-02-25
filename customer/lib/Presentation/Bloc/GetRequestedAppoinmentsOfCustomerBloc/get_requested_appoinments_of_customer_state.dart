part of 'get_requested_appoinments_of_customer_bloc.dart';

abstract class GetRequestedAppoinmentsOfCustomerStateBase {}

class GetRequestedAppoinmentsOfCustomerInitial
    extends GetRequestedAppoinmentsOfCustomerStateBase {}

class GetRequestedAppoinmentsOfCustomerLoading
    extends GetRequestedAppoinmentsOfCustomerStateBase {}

class GetRequestedAppoinmentsOfCustomerLoaded
    extends GetRequestedAppoinmentsOfCustomerStateBase {
  List<GetCustomerRequestedAppoinmentsModel>? model;
  GetRequestedAppoinmentsOfCustomerLoaded({this.model});
}

class GetRequestedAppoinmentsOfCustomerError
    extends GetRequestedAppoinmentsOfCustomerStateBase {}
