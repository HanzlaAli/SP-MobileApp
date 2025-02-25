// ignore_for_file: file_names

class SuccessModel {
  int? code;
  String? message;
  String? data;

  SuccessModel({this.code, this.message, this.data});

  SuccessModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    data = json['data'];
  }
}
