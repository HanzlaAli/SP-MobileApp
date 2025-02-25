part of 'get_serviceProvider_details_bloc.dart';

abstract class GetServiceProviderDetailStateBase {}

class GetServiceProviderDetailInitial extends GetServiceProviderDetailStateBase {}

class GetServiceProviderDetailLoading extends GetServiceProviderDetailStateBase {}

class GetServiceProviderDetailLoaded extends GetServiceProviderDetailStateBase {}

class GetServiceProviderDetailError extends GetServiceProviderDetailStateBase {
  ErrorModel? errorModel;
  GetServiceProviderDetailError({this.errorModel});
}
