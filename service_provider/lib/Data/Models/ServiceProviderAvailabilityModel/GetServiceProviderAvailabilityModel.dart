class GetServiceProviderAvailabilityModel {
  int? id;
  int? dayOfWeek;
  String? startTime;
  String? endTime;
  ServiceProvider? serviceProvider;

  GetServiceProviderAvailabilityModel(
      {this.id,
      this.dayOfWeek,
      this.startTime,
      this.endTime,
      this.serviceProvider});

  GetServiceProviderAvailabilityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayOfWeek = json['dayOfWeek'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    serviceProvider =
        json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
  }

}

class ServiceProvider {
  int? id;
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

  ServiceProvider(
      {this.id,
      this.fullName,
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
      this.isApproved});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
  }

}
