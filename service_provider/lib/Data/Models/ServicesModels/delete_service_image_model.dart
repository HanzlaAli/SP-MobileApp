class DeleteServiceImageModel {
  int? serviceId;
  String? imagePath;

  DeleteServiceImageModel({this.serviceId, this.imagePath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceId'] = serviceId;
    data['imagePath'] = imagePath;
    return data;
  }
}
