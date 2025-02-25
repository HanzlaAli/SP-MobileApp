class AppointmentHistoryOfServiceProviderModel {
  int? id;
  int? customerId;
  String? customerProfile;
  String? customerName;
  int? serviceProviderId;
  String? serviceProviderName;
  String? customerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  bool? isRejected;
  String? appointmentTypeName;

  AppointmentHistoryOfServiceProviderModel(
      {this.id,
      this.customerId,
      this.customerProfile,
      this.customerName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.customerServiceName,
      this.startTime,
      this.endTime,
      this.appointmentStatusName,
      this.date,
      this.isRejected,
      this.appointmentTypeName});

  AppointmentHistoryOfServiceProviderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    customerProfile = json['customerProfile'];
    customerName = json['customerName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    customerServiceName = json['customerServiceName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentStatusName = json['appointmentStatusName'];
    date = json['date'];
    isRejected = json['isRejected'];
    appointmentTypeName = json['appointmentTypeName'];
  }
}
