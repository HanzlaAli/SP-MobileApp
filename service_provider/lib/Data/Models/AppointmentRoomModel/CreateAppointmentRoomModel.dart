class CreateAppointmentRoomModel {
  AppointmentRoomRequest? appointmentRoomRequest;

  CreateAppointmentRoomModel({this.appointmentRoomRequest});

  CreateAppointmentRoomModel.fromJson(Map<String, dynamic> json) {
    appointmentRoomRequest = json['appointmentRoomRequest'] != null
        ? AppointmentRoomRequest.fromJson(json['appointmentRoomRequest'])
        : null;
  }

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

  AppointmentRoomRequest.fromJson(Map<String, dynamic> json) {
    roomName = json['roomName'];
    rtcToken = json['rtcToken'];
    appointmentId = json['appointmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roomName'] = roomName;
    data['rtcToken'] = rtcToken;
    data['appointmentId'] = appointmentId;
    return data;
  }
}
