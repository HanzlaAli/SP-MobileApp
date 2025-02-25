class GetServicesModel {
  int? id;
  String? name;
  String? therapyName;
  String? serviceProviderName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  GetServicesModel(
      {this.id,
      this.name,
      this.therapyName,
      this.serviceProviderName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  GetServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    therapyName = json['therapyName'];
    serviceProviderName = json['serviceProviderName'];
    charges = json['charges'];
    numberOfTimesAvailable = json['numberOfTimesAvailable'];
    validTill = json['validTill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['therapyName'] = therapyName;
    data['serviceProviderName'] = serviceProviderName;
    data['charges'] = charges;
    data['numberOfTimesAvailable'] = numberOfTimesAvailable;
    data['validTill'] = validTill;
    return data;
  }
}
