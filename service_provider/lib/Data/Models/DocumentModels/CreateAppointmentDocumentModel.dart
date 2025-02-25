class CreateAppointmentDocumentsModel {
  CreateAppointmentDocumentModel? createAppointmentDocumentModel;

  CreateAppointmentDocumentsModel({this.createAppointmentDocumentModel});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createAppointmentDocumentModel != null) {
      data['createAppointmentDocumentModel'] =
          createAppointmentDocumentModel!.toJson();
    }
    return data;
  }
}

class CreateAppointmentDocumentModel {
  int? appointmentId;
  String? summery;

  CreateAppointmentDocumentModel({this.appointmentId, this.summery});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointmentId'] = appointmentId;
    data['summery'] = summery;
    return data;
  }
}
