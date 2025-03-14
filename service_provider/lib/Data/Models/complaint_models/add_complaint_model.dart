class CreateComplaintModel {
  String? title;
  String? description;

  CreateComplaintModel({this.title, this.description});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['userType'] = "Customer";
    return data;
  }
}
