class RefreshTokenModel {
  String? token;
  String? refreshToken;

  RefreshTokenModel({this.token, this.refreshToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
