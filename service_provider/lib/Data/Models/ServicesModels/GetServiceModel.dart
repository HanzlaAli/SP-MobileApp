import 'package:mended_soluctions/Presentation/helper/ReusedFunctions.dart';

class GetServicesModel {
  int? id;
  String? name;
  String? description;
  String? therapyName;
  ServiceType? serviceType;
  ServiceProvider? serviceProvider;
  double? charges;
  double? discount;
  String? validTill;
  List<String>? images;

  GetServicesModel({
    this.id,
    this.name,
    this.description,
    this.therapyName,
    this.serviceType,
    this.serviceProvider,
    this.charges,
    this.discount,
    this.validTill,
    this.images,
  });

  GetServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    therapyName = json['therapyName'];
    serviceType = json['serviceType'] != null
        ? ServiceType.fromJson(json['serviceType'])
        : null;
    serviceProvider = json['serviceProvider'] != null
        ? ServiceProvider.fromJson(json['serviceProvider'])
        : null;
    charges = json['charges'];
    discount = json['discount'];
    validTill = json['validTill'];
    images = getImages(json['images']);
  }
}

class ServiceType {
  int? id;
  String? name;

  ServiceType({this.id, this.name});

  ServiceType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class ServiceProvider {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePicture;

  ServiceProvider({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.profilePicture,
  });

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profilePicture = json['profilePicture'];
  }
}
