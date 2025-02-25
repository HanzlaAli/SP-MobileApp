import 'package:image_picker/image_picker.dart';

class AddServiceProviderLicenseModel {
  String? serviceProviderEmail;
  XFile? frontImageFile;
  XFile? backImageFile;
  String? board;
  String? number;
  String? issueDate;
  String? expiryDate;
  int? licenseTypeId;
  String? frontImage;
  String? backImage;

  AddServiceProviderLicenseModel(
      {this.serviceProviderEmail,
      this.frontImageFile,
      this.backImageFile,
      this.board,
      this.number,
      this.issueDate,
      this.expiryDate,
      this.licenseTypeId,
      this.frontImage,
      this.backImage});

  AddServiceProviderLicenseModel.fromJson(Map<String, dynamic> json) {
    serviceProviderEmail = json['ServiceProviderEmail'];
    frontImageFile = json['FrontImageFile'];
    backImageFile = json['BackImageFile'];
    board = json['Board'];
    number = json['Number'];
    issueDate = json['IssueDate'];
    expiryDate = json['ExpiryDate'];
    licenseTypeId = json['LicenseTypeId'];
    frontImage = json['FrontImage'];
    backImage = json['BackImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ServiceProviderEmail'] = this.serviceProviderEmail;
    data['FrontImageFile'] = this.frontImageFile;
    data['BackImageFile'] = this.backImageFile;
    data['Board'] = this.board;
    data['Number'] = this.number;
    data['IssueDate'] = this.issueDate;
    data['ExpiryDate'] = this.expiryDate;
    data['LicenseTypeId'] = this.licenseTypeId;
    data['FrontImage'] = this.frontImage;
    data['BackImage'] = this.backImage;
    return data;
  }
}
