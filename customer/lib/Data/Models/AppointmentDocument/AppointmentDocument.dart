class AppointmentDocumentModel {
  int? appointmentId;
  String? summery;
  String? serviceName;
  String? serviceProviderName;
  String? CustomerName;
  String? fromTime;
  String? toTime;
  String? date;

  AppointmentDocumentModel(
      {this.appointmentId,
      this.summery,
      this.serviceProviderName,
      this.serviceName,
      this.CustomerName,
      this.fromTime,
      this.toTime,
      this.date});

  AppointmentDocumentModel.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointmentId'];
    summery = json['summery'];
    serviceProviderName = json['serviceProviderName'];
    CustomerName = json['CustomerName'];
    serviceName = json['serviceName'];
    fromTime = json['fromTime'];
    toTime = json['toTime'];
    date = json['date'];
  }
}
