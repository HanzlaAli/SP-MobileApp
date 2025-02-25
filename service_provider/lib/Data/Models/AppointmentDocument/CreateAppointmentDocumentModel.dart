class CreateAppointmentDocumentModel {
  CreateAppointmentDocument? createAppointmentDocument;

  CreateAppointmentDocumentModel({this.createAppointmentDocument});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createAppointmentDocument != null) {
      data['createAppointmentDocumentModel'] =
          createAppointmentDocument!.toJson();
    }
    return data;
  }
}

class CreateAppointmentDocument {
  int? appointmentId;
  String? summery;

  CreateAppointmentDocument({this.appointmentId, this.summery});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['summery'] = summery;
    return data;
  }
}
