class CreateQualificationModel {
  String? serviceProviderEmail;
  String? institutionName;
  String? name;
  String? procurementYear;

  CreateQualificationModel(
      {this.serviceProviderEmail,
      this.institutionName,
      this.name,
      this.procurementYear});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceProviderEmail'] = serviceProviderEmail;
    data['institutionName'] = institutionName;
    data['name'] = name;
    data['procurementYear'] = procurementYear;
    return data;
  }
}
