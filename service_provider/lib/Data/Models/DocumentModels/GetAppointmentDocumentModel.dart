class GetAppointmentDocumentModel {
  Appointment? appointment;
  Document? document;
  String? summery;

  GetAppointmentDocumentModel({this.appointment, this.document, this.summery});

  GetAppointmentDocumentModel.fromJson(Map<String, dynamic> json) {
    appointment = json['appointment'] != null
        ? Appointment.fromJson(json['appointment'])
        : null;
    document =
        json['document'] != null ? Document.fromJson(json['document']) : null;
    summery = json['summery'];
  }
}

class Appointment {
  int? id;
  String? customerName;
  String? serviceProviderName;
  String? customerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  String? rejectionReasonName;
  String? rejectionDescription;
  bool? isRejected;
  String? appointmentTypeName;

  Appointment(
      {this.id,
      this.customerName,
      this.serviceProviderName,
      this.customerServiceName,
      this.startTime,
      this.endTime,
      this.appointmentStatusName,
      this.date,
      this.rejectionReasonName,
      this.rejectionDescription,
      this.isRejected,
      this.appointmentTypeName});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customerName'];
    serviceProviderName = json['serviceProviderName'];
    customerServiceName = json['customerServiceName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentStatusName = json['appointmentStatusName'];
    date = json['date'];
    rejectionReasonName = json['rejectionReasonName'];
    rejectionDescription = json['rejectionDescription'];
    isRejected = json['isRejected'];
    appointmentTypeName = json['appointmentTypeName'];
  }
}

class Document {
  int? id;
  String? name;

  Document({this.id, this.name});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
