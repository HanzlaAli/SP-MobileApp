import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  int? uId;
  String? firstName;
  String? lastName;
  String? imageUrl;
  String? lastActive;
  bool? isActive;
  String? fcmToken;

  UserModel(
      {this.uId,
      this.firstName,
      this.fcmToken,
      this.lastName,
      this.imageUrl,
      this.lastActive,
      this.isActive});

  UserModel.fromSnapShot(DocumentSnapshot snapshot) {
    uId = int.parse(snapshot.id);
    firstName = snapshot['FirstName'];
    lastName = snapshot['LastName'];
    imageUrl = snapshot['imageUrl'];
    lastActive = snapshot['LastActive'];
    isActive = snapshot['isActive'];
    fcmToken = snapshot['FcmToken'];
  }

  Map<String, dynamic> toSnapShot() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UId'] = uId;
    data['FirstName'] = firstName;
    data['FcmToken'] = fcmToken;
    data['LastName'] = lastName;
    data['imageUrl'] = imageUrl;
    data['LastActive'] = lastActive;
    data['isActive'] = isActive;
    return data;
  }
}
