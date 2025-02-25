// ignore_for_file: file_names

class AddServicesModel {
  Service? service;

  AddServicesModel({this.service});

  AddServicesModel.fromJson(Map<String, dynamic> json) {
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (service != null) {
      data['service'] = service!.toJson();
    }
    return data;
  }
}

class Service {
  String? name;
  int? serviceProviderTherapyId;
  String? serviceProviderEmail;
  int? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  Service(
      {this.name,
      this.serviceProviderTherapyId,
      this.serviceProviderEmail,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  Service.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    serviceProviderTherapyId = json['serviceProviderTherapyId'];
    charges = json['charges'];
    numberOfTimesAvailable = json['numberOfTimesAvailable'];
    validTill = json['validTill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['serviceProviderTherapyId'] = serviceProviderTherapyId;
    data['charges'] = charges;
    data['numberOfTimesAvailable'] = numberOfTimesAvailable;
    data['validTill'] = validTill;
    data['email'] = "";
    return data;
  }
}
