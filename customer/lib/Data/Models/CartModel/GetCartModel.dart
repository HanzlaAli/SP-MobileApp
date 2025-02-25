class GetCartModel {
  int? id;
  Customer? customer;
  Service? service;
  int? quantity;
  String? updatedOn;

  GetCartModel(
      {this.id, this.customer, this.service, this.quantity, this.updatedOn});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customer =
        json['Customer'] != null ? Customer.fromJson(json['Customer']) : null;
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
    quantity = json['quantity'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (Customer != null) {
      data['Customer'] = customer!.toJson();
    }
    if (service != null) {
      data['service'] = service!.toJson();
    }
    data['quantity'] = quantity;
    data['updatedOn'] = updatedOn;
    return data;
  }
}

class Customer {
  int? id;
  User? user;
  String? profilePicture;

  Customer({this.id, this.user, this.profilePicture});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['profilePicture'] = profilePicture;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  User({this.id, this.firstName, this.lastName, this.email, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class Service {
  int? id;
  String? name;
  String? therapyName;
  String? serviceProviderName;
  double? charges;
  int? numberOfTimesAvailable;
  String? validTill;

  Service(
      {this.id,
      this.name,
      this.therapyName,
      this.serviceProviderName,
      this.charges,
      this.numberOfTimesAvailable,
      this.validTill});

  Service.fromJson(Map<String, dynamic> json) {
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
