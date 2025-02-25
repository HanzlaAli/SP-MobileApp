class DeleteCustomerRequestImageModel {
  int? serviceRequestId;
  String? imagePath;

  DeleteCustomerRequestImageModel({this.serviceRequestId, this.imagePath});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceRequestId'] = serviceRequestId;
    data['imagePath'] = imagePath;
    return data;
  }
}
