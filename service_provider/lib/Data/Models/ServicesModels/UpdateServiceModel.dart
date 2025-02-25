class UpdateServiceModel {
  Service? service;

  UpdateServiceModel({this.service});

  UpdateServiceModel.fromJson(Map<String, dynamic> json) {
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
  int? id;
  String? name;
  int? serviceProviderTherapyId;
  int? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  Service(
      {this.id,
      this.name,
      this.serviceProviderTherapyId,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    serviceProviderTherapyId = json['serviceProviderTherapyId'];
    charges = json['charges'];
    numberOfTimesAvailable = json['numberOfTimesAvailable'];
    validTill = json['validTill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['serviceProviderTherapyId'] = this.serviceProviderTherapyId;
    data['charges'] = this.charges;
    data['numberOfTimesAvailable'] = this.numberOfTimesAvailable;
    data['validTill'] = this.validTill;
    return data;
  }
}
