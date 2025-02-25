class ServiceProviderAvailabilityModel {
  int? dayOfWeek;
  String? startTime;
  String? endTime;
  ServiceProvider? serviceProvider;
  int? id;

  ServiceProviderAvailabilityModel(
      {this.dayOfWeek, this.startTime, this.endTime, this.serviceProvider, this.id});

  ServiceProviderAvailabilityModel.fromJson(Map<String, dynamic> json) {
    dayOfWeek = json['dayOfWeek'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    serviceProvider = json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
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
