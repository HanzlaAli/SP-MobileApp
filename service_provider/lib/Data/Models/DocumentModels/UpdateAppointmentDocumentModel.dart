class UpdateAppointmentDocumentsModel {
  UpdateAppointmentDocumentModel? updateAppointmentDocumentModel;

  UpdateAppointmentDocumentsModel({this.updateAppointmentDocumentModel});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (updateAppointmentDocumentModel != null) {
      data['updateAppointmentDocumentModel'] =
          updateAppointmentDocumentModel!.toJson();
    }
    return data;
  }
}

class UpdateAppointmentDocumentModel {
  int? id;
  int? appointmentId;
  int? documentId;
  String? summery;

  UpdateAppointmentDocumentModel(
      {this.id, this.appointmentId, this.documentId, this.summery});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointmentId'] = appointmentId;
    data['documentId'] = documentId;
    data['summery'] = summery;
    return data;
  }
}
