part of 'get_serviceProviders_bloc.dart';

abstract class GetServiceProvidersStateBase {}

class GetServiceProvidersInitial extends GetServiceProvidersStateBase {}

class GetServiceProvidersLoading extends GetServiceProvidersStateBase {}

class GetServiceProvidersLoaded extends GetServiceProvidersStateBase {
  List<GetServiceProvidersModel>? model;
  GetServiceProvidersLoaded({this.model});
}

class GetServiceProvidersError extends GetServiceProvidersStateBase {}
