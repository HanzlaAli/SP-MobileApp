class GetCustomerDetailsModel {
  User? user;
  String? profilePicture;
  List<Appointments>? appointments;
  int? id;

  GetCustomerDetailsModel(
      {this.user, this.profilePicture, this.appointments, this.id});

  GetCustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    profilePicture = json['profilePicture'];
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

class Appointments {
  int? id;
  int? CustomerId;
  String? CustomerProfile;
  String? CustomerName;
  int? serviceProviderId;
  String? serviceProviderName;
  String? CustomerServiceName;
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
      this.CustomerId,
      this.CustomerProfile,
      this.CustomerName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.CustomerServiceName,
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
    CustomerId = json['CustomerId'];
    CustomerProfile = json['CustomerProfile'];
    CustomerName = json['CustomerName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    CustomerServiceName = json['CustomerServiceName'];
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
