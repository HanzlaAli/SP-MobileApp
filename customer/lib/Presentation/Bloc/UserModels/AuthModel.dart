class AuthModel {
  String? token;
  String? expiration;
  String? refreshToken;

  AuthModel({this.token, this.expiration, this.refreshToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    refreshToken = json['refreshToken'];
  }
}
