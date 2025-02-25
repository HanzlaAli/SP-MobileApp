class GetServiceProviderDetailsModel {
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
  List<Appointments>? appointments;
  int? id;

  GetServiceProviderDetailsModel(
      {this.user,
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
      this.specializations,
      this.appointments,
      this.id});

  GetServiceProviderDetailsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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
        qualifications!.add(Qualifications.fromJson(v));
      });
    }
    if (json['serviceProviderTherapies'] != null) {
      serviceProviderTherapies = <ServiceProviderTherapies>[];
      json['serviceProviderTherapies'].forEach((v) {
        serviceProviderTherapies!.add(ServiceProviderTherapies.fromJson(v));
      });
    }
    serviceProviderLicense = json['serviceProviderLicense'] != null
        ? ServiceProviderLicense.fromJson(json['serviceProviderLicense'])
        : null;
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
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

class Qualifications {
  String? serviceProviderName;
  String? name;
  String? institutionName;
  String? procurementYear;
  int? id;

  Qualifications(
      {this.serviceProviderName,
      this.name,
      this.institutionName,
      this.procurementYear,
      this.id});

  Qualifications.fromJson(Map<String, dynamic> json) {
    serviceProviderName = json['serviceProviderName'];
    name = json['name'];
    institutionName = json['institutionName'];
    procurementYear = json['procurementYear'];
    id = json['id'];
  }

}

class ServiceProviderTherapies {
  String? serviceProviderName;
  String? therapyName;
  int? id;

  ServiceProviderTherapies({this.serviceProviderName, this.therapyName, this.id});

  ServiceProviderTherapies.fromJson(Map<String, dynamic> json) {
    serviceProviderName = json['serviceProviderName'];
    therapyName = json['therapyName'];
    id = json['id'];
  }

}

class ServiceProviderLicense {
  String? board;
  String? number;
  String? issueDate;
  String? expiryDate;
  LicenseType? licenseType;
  String? frontImage;
  String? backImage;
  int? id;

  ServiceProviderLicense(
      {this.board,
      this.number,
      this.issueDate,
      this.expiryDate,
      this.licenseType,
      this.frontImage,
      this.backImage,
      this.id});

  ServiceProviderLicense.fromJson(Map<String, dynamic> json) {
    board = json['board'];
    number = json['number'];
    issueDate = json['issueDate'];
    expiryDate = json['expiryDate'];
    licenseType = json['licenseType'] != null
        ? LicenseType.fromJson(json['licenseType'])
        : null;
    frontImage = json['frontImage'];
    backImage = json['backImage'];
    id = json['id'];
  }

}

class LicenseType {
  String? name;
  int? id;

  LicenseType({this.name, this.id});

  LicenseType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

}

class Appointments {
  int? id;
  int? customerId;
  String? customerProfile;
  String? customerName;
  int? serviceProviderId;
  String? serviceProviderName;
  String? customerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  String? rejectionReasonName;
  String? rejectionDescription;
  bool? isRejected;
  String? appointmentTypeName;

  Appointments(
      {this.id,
      this.customerId,
      this.customerProfile,
      this.customerName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.customerServiceName,
      this.startTime,
      this.endTime,
      this.appointmentStatusName,
      this.date,
      this.rejectionReasonName,
      this.rejectionDescription,
      this.isRejected,
      this.appointmentTypeName});

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    customerProfile = json['customerProfile'];
    customerName = json['customerName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    customerServiceName = json['customerServiceName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentStatusName = json['appointmentStatusName'];
    date = json['date'];
    rejectionReasonName = json['rejectionReasonName'];
    rejectionDescription = json['rejectionDescription'];
    isRejected = json['isRejected'];
    appointmentTypeName = json['appointmentTypeName'];
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
}
