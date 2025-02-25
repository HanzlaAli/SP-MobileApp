// ignore_for_file: file_names
class LogInModel {
  String? email;
  String? password;

  LogInModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
