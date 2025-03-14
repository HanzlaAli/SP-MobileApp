import 'package:cloud_firestore/cloud_firestore.dart';

class ChatHeadModel {
  int? userId;
  List<Users>? users;

  ChatHeadModel({this.userId, this.users});

  ChatHeadModel.fromJson(DocumentSnapshot json) {
    userId = int.parse(json.id);
    Map<String, dynamic>? data = json.data() as Map<String, dynamic>?;
      
    if(data != null){
    if (json['Users'] != null) {
      users = <Users>[];
      json['Users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    if (users != null) {
      data['Users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? userId;

  Users({this.userId});

  Users.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    return data;
  }
}
