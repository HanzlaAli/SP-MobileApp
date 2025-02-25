class ChangePasswordModel {
  String? email;
  String? currentPassword;
  String? newPassword;

  ChangePasswordModel({this.email, this.currentPassword, this.newPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['currentPassword'] = this.currentPassword;
    data['newPassword'] = this.newPassword;
    return data;
  }
}
