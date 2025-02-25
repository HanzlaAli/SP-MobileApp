class ServiceProviderProfileModel {
  int? id;
  User? user;
  String? bio;
  String? gender;
  String? profilePicture;
  String? businessAddress;
  String? businessPhoneNumber;
  String? dateOfBirth;
  String? streetAddress;
  String? city;
  String? state;
  String? zip;
  List<Qualifications>? qualifications;
  List<ServiceProviderTherapies>? serviceProviderTherapies;
  ServiceProviderLicense? serviceProviderLicense;
  List<Specializations>? specializations;

  ServiceProviderProfileModel(
      {this.id,
      this.user,
      this.bio,
      this.gender,
      this.profilePicture,
      this.businessAddress,
      this.businessPhoneNumber,
      this.dateOfBirth,
      this.streetAddress,
      this.city,
      this.state,
      this.zip,
      this.qualifications,
      this.serviceProviderTherapies,
      this.serviceProviderLicense,
      this.specializations});

  ServiceProviderProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    bio = json['bio'];
    gender = json['gender'];
    profilePicture = json['profilePicture'];
    businessAddress = json['businessAddress'];
    businessPhoneNumber = json['businessPhoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    streetAddress = json['streetAddress'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    if (json['qualifications'] != null) {
      qualifications = <Qualifications>[];
      json['qualifications'].forEach((v) {
        qualifications!.add( Qualifications.fromJson(v));
      });
    }
    if (json['serviceProviderTherapies'] != null) {
      serviceProviderTherapies = <ServiceProviderTherapies>[];
      json['serviceProviderTherapies'].forEach((v) {
        serviceProviderTherapies!.add( ServiceProviderTherapies.fromJson(v));
      });
    }
    serviceProviderLicense = json['serviceProviderLicense'] != null
        ?  ServiceProviderLicense.fromJson(json['serviceProviderLicense'])
        : null;
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add( Specializations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['bio'] = this.bio;
    data['gender'] = this.gender;
    data['profilePicture'] = this.profilePicture;
    data['businessAddress'] = this.businessAddress;
    data['businessPhoneNumber'] = this.businessPhoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['streetAddress'] = this.streetAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    if (this.qualifications != null) {
      data['qualifications'] =
          this.qualifications!.map((v) => v.toJson()).toList();
    }
    if (this.serviceProviderTherapies != null) {
      data['serviceProviderTherapies'] =
          this.serviceProviderTherapies!.map((v) => v.toJson()).toList();
    }
    if (this.serviceProviderLicense != null) {
      data['serviceProviderLicense'] = this.serviceProviderLicense!.toJson();
    }
    if (this.specializations != null) {
      data['specializations'] =
          this.specializations!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class Qualifications {
  int? id;
  String? serviceProviderName;
  String? name;
  String? institutionName;
  String? procurementYear;

  Qualifications(
      {this.id,
      this.serviceProviderName,
      this.name,
      this.institutionName,
      this.procurementYear});

  Qualifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderName = json['serviceProviderName'];
    name = json['name'];
    institutionName = json['institutionName'];
    procurementYear = json['procurementYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceProviderName'] = this.serviceProviderName;
    data['name'] = this.name;
    data['institutionName'] = this.institutionName;
    data['procurementYear'] = this.procurementYear;
    return data;
  }
}

class ServiceProviderTherapies {
  int? id;
  String? serviceProviderName;
  String? therapyName;

  ServiceProviderTherapies({this.id, this.serviceProviderName, this.therapyName});

  ServiceProviderTherapies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderName = json['serviceProviderName'];
    therapyName = json['therapyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['serviceProviderName'] = this.serviceProviderName;
    data['therapyName'] = this.therapyName;
    return data;
  }
}

class ServiceProviderLicense {
  int? id;
  String? board;
  String? number;
  String? issueDate;
  String? expiryDate;
  LicenseType? licenseType;
  String? frontImage;
  String? backImage;

  ServiceProviderLicense(
      {this.id,
      this.board,
      this.number,
      this.issueDate,
      this.expiryDate,
      this.licenseType,
      this.frontImage,
      this.backImage});

  ServiceProviderLicense.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    board = json['board'];
    number = json['number'];
    issueDate = json['issueDate'];
    expiryDate = json['expiryDate'];
    licenseType = json['licenseType'] != null
        ? new LicenseType.fromJson(json['licenseType'])
        : null;
    frontImage = json['frontImage'];
    backImage = json['backImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['board'] = this.board;
    data['number'] = this.number;
    data['issueDate'] = this.issueDate;
    data['expiryDate'] = this.expiryDate;
    if (this.licenseType != null) {
      data['licenseType'] = this.licenseType!.toJson();
    }
    data['frontImage'] = this.frontImage;
    data['backImage'] = this.backImage;
    return data;
  }
}

class LicenseType {
  int? id;
  String? name;

  LicenseType({this.id, this.name});

  LicenseType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Specializations {
  int? id;
  String? name;

  Specializations({this.id, this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}