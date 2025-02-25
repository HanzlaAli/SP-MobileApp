// ignore_for_file: file_names

import 'package:image_picker/image_picker.dart' show XFile;

class SetUpCustomerProfileModel {
  XFile? profilePictureFile;
  String? profilePicture;
  String? userEmail;
  

  SetUpCustomerProfileModel(
      {this.profilePictureFile, this.profilePicture, this.userEmail});

  SetUpCustomerProfileModel.fromJson(Map<String, dynamic> json) {
    profilePictureFile = json['ProfilePictureFile'];
    profilePicture = json['ProfilePicture'];
    userEmail = json['UserEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProfilePictureFile'] = profilePictureFile;
    data['ProfilePicture'] = profilePicture;
    data['UserEmail'] = userEmail;
    return data;
  }
}
