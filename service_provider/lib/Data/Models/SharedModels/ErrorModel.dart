// ignore_for_file: file_names
class ErrorModel {
  int? code;
  String? message;
  String? data;

  ErrorModel({this.code, this.message, this.data});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['Code'];
    message = json['Message'];
    data = json['data'];
  }
}
