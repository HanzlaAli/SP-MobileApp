// ignore_for_file: file_names

class ForgetPasswordModel {
  String? email;

  ForgetPasswordModel({
    this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
