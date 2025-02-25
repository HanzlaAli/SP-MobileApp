part of 'get_customer_details_bloc.dart';

abstract class GetCustomerDetailStateBase {}

class GetCustomerDetailInitial extends GetCustomerDetailStateBase {}

class GetCustomerDetailLoading extends GetCustomerDetailStateBase {}

class GetCustomerDetailLoaded extends GetCustomerDetailStateBase {}

class GetCustomerDetailError extends GetCustomerDetailStateBase {
  ErrorModel? errorModel;
  GetCustomerDetailError({this.errorModel});
}

