part of 'appointment_room_bloc.dart';

abstract class AppointmentRoomEvent {}

class AddAppointmentRoom extends AppointmentRoomEvent {
  String? customerId;
  CreateAppointmentRoomModel? model;
  AddAppointmentRoom({this.model, this.customerId});
}

class GetAppointMentRoomByAppointmentId extends AppointmentRoomEvent {
  String? id;
  GetAppointMentRoomByAppointmentId({this.id});
}

class DeleteAppointmentRoom extends AppointmentRoomEvent {
  String? roomId;
  DeleteAppointmentRoom({this.roomId});
}
