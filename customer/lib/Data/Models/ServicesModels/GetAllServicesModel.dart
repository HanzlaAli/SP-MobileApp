class GetAllServiceModel {
  String? name;
  String? therapyName;
  int? serviceProviderId;
  String? serviceProviderName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;
  int? id;

  GetAllServiceModel(
      {this.name,
      this.therapyName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill,
      this.id});

  GetAllServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    therapyName = json['therapyName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    charges = json['charges'];
    numberOfTimesAvailable = json['numberOfTimesAvailable'];
    validTill = json['validTill'];
    id = json['id'];
  }
}
