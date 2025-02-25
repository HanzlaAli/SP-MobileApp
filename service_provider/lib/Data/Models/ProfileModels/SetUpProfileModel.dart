import 'package:image_picker/image_picker.dart';

class SetUpProfileModel {
  String? bio;
  String? gender;
  var profilePictureFile;
  String? profilePicture;
  String? businessAddress;
  String? businessPhoneNumber;
  String? dateOfBirth;
  String? streetAddress;
  String? city;
  String? state;
  String? zip;
  String? userEmail;

  SetUpProfileModel(
      {this.bio,
      this.gender,
      this.profilePictureFile,
      this.profilePicture,
      this.businessAddress,
      this.businessPhoneNumber,
      this.dateOfBirth,
      this.streetAddress,
      this.city,
      this.state,
      this.zip,
      this.userEmail});

  SetUpProfileModel.fromJson(Map<String, dynamic> json) {
    bio = json['Bio'];
    gender = json['Gender'];
    profilePictureFile = json['ProfilePictureFile'];
    profilePicture = json['ProfilePicture'];
    businessAddress = json['BusinessAddress'];
    businessPhoneNumber = json['BusinessPhoneNumber'];
    dateOfBirth = json['DateOfBirth'];
    streetAddress = json['StreetAddress'];
    city = json['City'];
    state = json['State'];
    zip = json['Zip'];
    userEmail = json['UserEmail'];
  }

  Future<Map<String, dynamic>> toJson() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bio'] = bio;
    data['Gender'] = gender;
    data['ProfilePictureFile'] = "";
    data['ProfilePicture'] = profilePicture;
    data['BusinessAddress'] = businessAddress;
    data['BusinessPhoneNumber'] = businessPhoneNumber;
    data['DateOfBirth'] = dateOfBirth;
    data['StreetAddress'] = streetAddress;
    data['City'] = city;
    data['State'] = state;
    data['Zip'] = zip;
    data['UserEmail'] = userEmail;
    return data;
  }
}
