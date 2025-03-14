// ignore_for_file: file_names

import 'package:image_picker/image_picker.dart';

class CreateOrEditServiceModel {
  int id;
  String name;
  String description;
  int serviceProviderServiceTypeId;
  String serviceProviderEmail;
  double charges;
  double discount;
  List<XFile> images;
  DateTime validTill;

  CreateOrEditServiceModel({
    required this.name,
    required this.description,
    required this.serviceProviderServiceTypeId,
    required this.serviceProviderEmail,
    required this.charges,
    required this.discount,
    required this.images,
    required this.validTill,
    required this.id,
  });
}
