part of 'get_appointment_by_serviceProvider_bloc.dart';

abstract class GetAppointmentByServiceProviderEvent {}

class GetAppointmentsOfServiceProvider extends GetAppointmentByServiceProviderEvent {
  GetServiceProviderAppointments? model;
  GetAppointmentsOfServiceProvider({this.model});
}
