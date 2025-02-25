class GetCustomerBookedServiceModel {
  String? name;
  String? therapyName;
  int? serviceProviderId;
  String? serviceProviderName;
  int? CustomerId;
  String? CustomerName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;
  int? id;

  GetCustomerBookedServiceModel(
      {this.name,
      this.therapyName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.CustomerId,
      this.CustomerName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill,
      this.id});

  GetCustomerBookedServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    therapyName = json['therapyName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    CustomerId = json['CustomerId'];
    CustomerName = json['CustomerName'];
    charges = json['charges'];
    numberOfTimesAvailable = json['numberOfTimesAvailable'];
    validTill = json['validTill'];
    id = json['id'];
  }
}
