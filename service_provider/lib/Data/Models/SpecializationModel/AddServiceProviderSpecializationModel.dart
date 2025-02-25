class AddServiceProviderSpecializationModel {
  String? serviceProviderEmail;
  int? specializationId;

  AddServiceProviderSpecializationModel({this.serviceProviderEmail, this.specializationId});

  AddServiceProviderSpecializationModel.fromJson(Map<String, dynamic> json) {
    serviceProviderEmail = json['serviceProviderEmail'];
    specializationId = json['specializationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceProviderEmail'] = this.serviceProviderEmail;
    data['specializationId'] = this.specializationId;
    return data;
  }
}
