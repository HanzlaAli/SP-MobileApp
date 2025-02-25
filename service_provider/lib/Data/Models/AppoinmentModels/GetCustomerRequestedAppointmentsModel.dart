class GetCustomerRequestedAppoinmentsModel {
  int? id;
  CustomerService? customerService;
  String? createdOn;

  GetCustomerRequestedAppoinmentsModel(
      {this.id, this.customerService, this.createdOn});

  GetCustomerRequestedAppoinmentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerService = json['customerService'] != null
        ? new CustomerService.fromJson(json['customerService'])
        : null;
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    if (customerService != null) {
      data['customerService'] = customerService!.toJson();
    }
    data['createdOn'] = createdOn;
    return data;
  }
}

class CustomerService {
  int? id;
  String? name;
  String? therapyName;
  int? serviceProviderUId;
  String? serviceProviderName;
  int? customerUId;
  String? customerName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  CustomerService(
      {this.id,
      this.name,
      this.therapyName,
      this.serviceProviderUId,
      this.serviceProviderName,
      this.customerUId,
      this.customerName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  CustomerService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    therapyName = json['therapyName'];
    serviceProviderUId = json['serviceProviderUId'];
    serviceProviderName = json['serviceProviderName'];
    customerUId = json['customerUId'];
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
    data['serviceProviderUId'] = serviceProviderUId;
    data['serviceProviderName'] = serviceProviderName;
    data['customerUId'] = customerUId;
    data['customerName'] = customerName;
    data['charges'] = charges;
    data['numberOfTimesAvailable'] = numberOfTimesAvailable;
    data['validTill'] = validTill;
    return data;
  }
}
