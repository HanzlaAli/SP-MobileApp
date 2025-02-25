part of 'get_appointment_history_bloc.dart';

abstract class GetAppointmentHistoryState {}

class GetAppointmentHistoryInitial extends GetAppointmentHistoryState {}

class GetAppointmentHistoryLoading extends GetAppointmentHistoryState {}

class GetAppointmentHistoryLoaded extends GetAppointmentHistoryState {
  List<AppointmentHistoryOfCustomerModel>? model;
  GetAppointmentHistoryLoaded({this.model});
}

class GetAppointmentHistoryError extends GetAppointmentHistoryState {
  ErrorModel? model;
  GetAppointmentHistoryError({this.model});
}
