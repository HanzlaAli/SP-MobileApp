part of 'appointment_room_bloc.dart';

abstract class AppointmentRoomState {}

class AppointmentRoomInitial extends AppointmentRoomState {}

class AppointmentRoomSuccess extends AppointmentRoomState {
  AppoinmentRoomResponseModel? model;
  AppointmentRoomSuccess({this.model});
}

class AppointmentRoomError extends AppointmentRoomState {
  ErrorModel? model;
  AppointmentRoomError({this.model});
}
