class GetCustomerBookedServiceModel {
  int? id;
  String? name;
  String? therapyName;
  String? serviceProviderName;
  String? customerName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  GetCustomerBookedServiceModel(
      {this.id,
      this.name,
      this.therapyName,
      this.serviceProviderName,
      this.customerName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  GetCustomerBookedServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    therapyName = json['therapyName'];
    serviceProviderName = json['serviceProviderName'];
    customerName = json['customerName'];
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
    data['customerName'] = customerName;
    data['charges'] = charges;
    data['numberOfTimesAvailable'] = numberOfTimesAvailable;
    data['validTill'] = validTill;
    return data;
  }
}
