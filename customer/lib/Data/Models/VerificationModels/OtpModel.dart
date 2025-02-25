// ignore_for_file: file_names

class OtpModel {
  String? otp;
  OtpModel({this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    return data;
  }
}
