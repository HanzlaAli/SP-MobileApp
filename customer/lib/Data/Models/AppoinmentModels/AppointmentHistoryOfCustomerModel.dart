class AppointmentHistoryOfCustomerModel {
  int? id;
  int? CustomerId;
  String? CustomerProfile;
  String? CustomerName;
  int? serviceProviderId;
  String? serviceProviderName;
  String? CustomerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  bool? isRejected;
  String? appointmentTypeName;

  AppointmentHistoryOfCustomerModel(
      {this.id,
      this.CustomerId,
      this.CustomerProfile,
      this.CustomerName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.CustomerServiceName,
      this.startTime,
      this.endTime,
      this.appointmentStatusName,
      this.date,
      this.isRejected,
      this.appointmentTypeName});

  AppointmentHistoryOfCustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    CustomerId = json['CustomerId'];
    CustomerProfile = json['CustomerProfile'];
    CustomerName = json['CustomerName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    CustomerServiceName = json['CustomerServiceName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentStatusName = json['appointmentStatusName'];
    date = json['date'];
    isRejected = json['isRejected'];
    appointmentTypeName = json['appointmentTypeName'];
  }
}
