class GetServiceProviderTherapyModel {
  String? serviceProviderName;
  String? therapyName;
  int? id;

  GetServiceProviderTherapyModel({this.serviceProviderName, this.therapyName, this.id});

  GetServiceProviderTherapyModel.fromJson(Map<String, dynamic> json) {
    serviceProviderName = json['serviceProviderName'];
    therapyName = json['therapyName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceProviderName'] = serviceProviderName;
    data['therapyName'] = therapyName;
    data['id'] = id;
    return data;
  }
}
