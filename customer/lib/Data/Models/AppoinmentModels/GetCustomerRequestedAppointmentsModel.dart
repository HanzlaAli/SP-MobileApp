class GetCustomerRequestedAppoinmentsModel {
  int? id;
  CustomerService? customerService;
  String? createdOn;

  GetCustomerRequestedAppoinmentsModel(
      {this.id, this.customerService, this.createdOn});

  GetCustomerRequestedAppoinmentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerService = json['CustomerService'] != null
        ? CustomerService.fromJson(json['CustomerService'])
        : null;
    createdOn = json['createdOn'];
  }
}

class CustomerService {
  int? id;
  String? name;
  String? therapyName;
  String? serviceProviderName;
  String? customerName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  CustomerService(
      {this.id,
      this.name,
      this.therapyName,
      this.serviceProviderName,
      this.customerName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  CustomerService.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    therapyName = json['therapyName'];
    serviceProviderName = json['serviceProviderName'];
    customerName = json['CustomerName'];
    charges = json['charges'];
    numberOfTimesAvailable = json['numberOfTimesAvailable'];
    validTill = json['validTill'];
  }
}
