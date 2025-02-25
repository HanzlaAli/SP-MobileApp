class AddServiceProviderTherapyModel {
  int? therapyTypeId;

  AddServiceProviderTherapyModel({this.therapyTypeId});

  AddServiceProviderTherapyModel.fromJson(Map<String, dynamic> json) {
    therapyTypeId = json['therapyTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['therapyTypeId'] = this.therapyTypeId;
    return data;
  }
}
