class FilterServiceRequestModel {
  int? therapyTypeId;

  FilterServiceRequestModel({this.therapyTypeId});

  FilterServiceRequestModel.fromJson(Map<String, dynamic> json) {
    therapyTypeId = json['therapyTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['therapyTypeId'] = therapyTypeId;
    return data;
  }
}
