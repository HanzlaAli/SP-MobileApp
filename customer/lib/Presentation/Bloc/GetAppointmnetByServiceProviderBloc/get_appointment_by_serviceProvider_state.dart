part of 'get_appointment_by_serviceProvider_bloc.dart';

abstract class GetAppointmentByServiceProviderState {}

class GetAppointmentByServiceProviderInitial extends GetAppointmentByServiceProviderState {}

class GetAppointmentByServiceProviderLoading extends GetAppointmentByServiceProviderState {}

class GetAppointmentByServiceProviderLoaded extends GetAppointmentByServiceProviderState {
  List<GetServiceProviderAppointmentsResponseModel>? model;
  GetAppointmentByServiceProviderLoaded({this.model});
}

class GetAppointmentByServiceProviderError extends GetAppointmentByServiceProviderState {}
