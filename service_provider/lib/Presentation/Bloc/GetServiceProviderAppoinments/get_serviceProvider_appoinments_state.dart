part of 'get_serviceProvider_appoinments_bloc.dart';

abstract class GetServiceProviderAppoinmentsStateBase {}

class GetServiceProviderAppoinmentsInitial extends GetServiceProviderAppoinmentsStateBase {}

class GetServiceProviderAppoinmentsLoading extends GetServiceProviderAppoinmentsStateBase {}

class GetServiceProviderAppoinmentsLoaded extends GetServiceProviderAppoinmentsStateBase {
  List<GetServiceProviderAppoinmentsModel>? model;
  GetServiceProviderAppoinmentsLoaded({this.model});
}

class GetServiceProviderAppoinmentsError extends GetServiceProviderAppoinmentsStateBase {}
