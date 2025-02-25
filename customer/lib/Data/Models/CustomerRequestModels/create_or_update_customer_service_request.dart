import 'package:image_picker/image_picker.dart';

class CreateOrUpdateCustomerServiceRequestModel {
  int? id;
  String? title;
  int? serviceTypeId;
  String? description;
  List<XFile>? images;
  int? budget;
  String? userEmail;

  CreateOrUpdateCustomerServiceRequestModel(
      {this.title,
      this.serviceTypeId,
      this.description,
      this.images,
      this.budget,
      this.userEmail,
      this.id});
}
