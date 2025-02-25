part of 'appointment_room_bloc.dart';

abstract class AppointmentRoomState {}

class AppointmentRoomInitial extends AppointmentRoomState {}

class AppointmentRoomCreated extends AppointmentRoomState {
  AppoinmentRoomResponseModel? model;
  AppointmentRoomCreated({this.model});
}

class AppointmentRoomError extends AppointmentRoomState {
    ErrorModel? model;
  AppointmentRoomError({this.model});
}
