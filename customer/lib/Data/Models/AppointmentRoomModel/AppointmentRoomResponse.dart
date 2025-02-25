class AppoinmentRoomResponseModel {
  int? id;
  String? roomName;
  String? rtcToken;
  int? serviceProviderId;
  String? serviceProviderName;
  int? CustomerId;
  String? CustomerName;
  String? startTime;
  String? endTime;
  int? appointmentId;

  AppoinmentRoomResponseModel(
      {this.id,
      this.roomName,
      this.rtcToken,
      this.serviceProviderId,
      this.serviceProviderName,
      this.CustomerId,
      this.CustomerName,
      this.startTime,
      this.endTime,
      this.appointmentId});

  AppoinmentRoomResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    rtcToken = json['rtcToken'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    CustomerId = json['CustomerId'];
    CustomerName = json['CustomerName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentId = json['appointmentId'];
  }
}
