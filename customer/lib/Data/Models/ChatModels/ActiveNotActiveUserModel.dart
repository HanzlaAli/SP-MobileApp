class ActiveNotActiveUserModel {
  String? userId;
  bool? isActive;
  ActiveNotActiveUserModel({this.isActive, this.userId});
  Map<String, dynamic> toSnapshot() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isActive'] = isActive;
    return data;
  }
}
