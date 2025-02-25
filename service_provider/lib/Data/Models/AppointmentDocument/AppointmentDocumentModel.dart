class AppointmentDocumentModel {
  int? appointmentId;
  String? summery;
  String? serviceProviderName;
  String? customerName;
  String? serviceName;
  String? fromTime;
  String? toTime;
  String? date;

  AppointmentDocumentModel(
      {this.appointmentId,
      this.summery,
      this.serviceProviderName,
      this.serviceName,
      this.customerName,
      this.fromTime,
      this.toTime,
      this.date});

  AppointmentDocumentModel.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    summery = json['summery'];
    serviceProviderName = json['serviceProviderName'];
    customerName = json['customerName'];
    serviceName = json['serviceName'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    date = json['date'];
  }
}
