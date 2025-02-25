class AppoinmentRoomResponseModel {
  int? id;
  String? roomName;
  String? rtcToken;
  int? serviceProviderId;
  String? serviceProviderName;
  int? customerId;
  String? customerName;
  String? startTime;
  String? endTime;
  int? appointmentId;

  AppoinmentRoomResponseModel(
      {this.id,
      this.roomName,
      this.rtcToken,
      this.serviceProviderId,
      this.serviceProviderName,
      this.customerId,
      this.customerName,
      this.startTime,
      this.endTime,
      this.appointmentId});

  AppoinmentRoomResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomName = json['roomName'];
    rtcToken = json['rtcToken'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentId = json['appointmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomName'] = this.roomName;
    data['rtcToken'] = this.rtcToken;
    data['serviceProviderId'] = this.serviceProviderId;
    data['serviceProviderName'] = this.serviceProviderName;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['appointmentId'] = this.appointmentId;
    return data;
  }
}
