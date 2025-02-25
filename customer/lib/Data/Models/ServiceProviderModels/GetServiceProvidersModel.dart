class GetServiceProvidersModel {
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
  int? id;

  GetServiceProvidersModel(
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
      this.id});

  GetServiceProvidersModel.fromJson(Map<String, dynamic> json) {
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
    id = json['id'];
  }
}
