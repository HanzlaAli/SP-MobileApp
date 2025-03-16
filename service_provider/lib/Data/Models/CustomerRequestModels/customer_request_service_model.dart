import '../../../Presentation/helper/Constants/Constants.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';

class CustomerRequestServiceModel {
  String? title;
  ServiceType? serviceType;
  String? description;
  List<String>? images;
  int? budget;
  User? user;
  int? id;

  CustomerRequestServiceModel({
    this.title,
    this.serviceType,
    this.description,
    this.images,
    this.budget,
    this.user,
    this.id,
  });

  CustomerRequestServiceModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    serviceType = json['serviceType'] != null
        ? ServiceType.fromJson(json['serviceType'])
        : null;
    description = json['description'];
    images = getImages(json['images'].toString());
    budget = json['budget'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    id = json['id'];
  }
}

class ServiceType {
  String? name;
  int? id;

  ServiceType({this.name, this.id});

  ServiceType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
}

class User {
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? profilePicture;
  int? id;

  User(
      {this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.profilePicture,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profilePicture = baseUrl + json['profilePicture'];
    id = json['id'];
  }
}
