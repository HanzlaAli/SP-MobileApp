import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHeadModel {
  int? userId;
  List<Users>? users;

  ChatHeadModel({this.userId, this.users});

  ChatHeadModel.fromJson(DocumentSnapshot json) {
    userId = int.parse(json.id);
    if (json['Users'] != null) {
      users = <Users>[];
      json['Users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }
}

class Users {
  int? userId;

  Users({this.userId});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
  }
}
