class DeleteServiceModel {
  int? serviceId;

  DeleteServiceModel({this.serviceId});

  DeleteServiceModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['serviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    return data;
  }
}
