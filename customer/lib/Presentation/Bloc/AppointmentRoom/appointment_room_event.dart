part of 'appointment_room_bloc.dart';

abstract class AppointmentRoomEvent {}

class GetAppointMentRoomByAppointmentId extends AppointmentRoomEvent {
  int? id,serviceProviderId;
  GetAppointMentRoomByAppointmentId({this.id,required this.serviceProviderId});
}
