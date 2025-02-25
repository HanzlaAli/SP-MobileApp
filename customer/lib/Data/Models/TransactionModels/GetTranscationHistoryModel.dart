class GetTransactionHistoryModel {
  int? totalAmount;
  String? description;
  String? updatedOn;
  Customer? customer;
  ServiceProvider? serviceProvider;
  int? id;

  GetTransactionHistoryModel(
      {this.totalAmount,
      this.description,
      this.updatedOn,
      this.customer,
      this.serviceProvider,
      this.id});

  GetTransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    description = json['description'];
    updatedOn = json['updatedOn'];
    customer =
        json['Customer'] != null ? Customer.fromJson(json['Customer']) : null;
    serviceProvider =
        json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
    id = json['id'];
  }

}

class Customer {
  User? user;
  String? profilePicture;
  int? id;

  Customer({this.user, this.profilePicture, this.id});

  Customer.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    profilePicture = json['profilePicture'];
    id = json['id'];
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  int? id;

  User({this.firstName, this.lastName, this.email, this.phoneNumber, this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    id = json['id'];
  }

}

class ServiceProvider {
  String? fullName;
  String? bio;
  String? serviceProviderEmail;
  String? gender;
  String? profilePicture;
  String? businessAddress;
  String? businessPhoneNumber;
  String? streetAddress;
  String? city;
  String? state;
  String? zip;
  bool? isApproved;
  int? id;

  ServiceProvider(
      {this.fullName,
      this.bio,
      this.serviceProviderEmail,
      this.gender,
      this.profilePicture,
      this.businessAddress,
      this.businessPhoneNumber,
      this.streetAddress,
      this.city,
      this.state,
      this.zip,
      this.isApproved,
      this.id});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    bio = json['bio'];
    serviceProviderEmail = json['serviceProviderEmail'];
    gender = json['gender'];
    profilePicture = json['profilePicture'];
    businessAddress = json['businessAddress'];
    businessPhoneNumber = json['businessPhoneNumber'];
    streetAddress = json['streetAddress'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    isApproved = json['isApproved'];
    id = json['id'];
  }

}
