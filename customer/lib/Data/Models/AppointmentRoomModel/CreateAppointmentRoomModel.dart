class CreateAppointmentRoomModel {
  AppointmentRoomRequest? appointmentRoomRequest;

  CreateAppointmentRoomModel({this.appointmentRoomRequest});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointmentRoomRequest != null) {
      data['appointmentRoomRequest'] = appointmentRoomRequest!.toJson();
    }
    return data;
  }
}

class AppointmentRoomRequest {
  String? roomName;
  String? rtcToken;
  int? appointmentId;

  AppointmentRoomRequest({this.roomName, this.rtcToken, this.appointmentId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomName'] = roomName;
    data['rtcToken'] = rtcToken;
    data['appointmentId'] = appointmentId;
    return data;
  }
}
