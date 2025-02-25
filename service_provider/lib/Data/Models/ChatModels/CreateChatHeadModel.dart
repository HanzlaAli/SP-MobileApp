import 'package:cloud_firestore/cloud_firestore.dart';

class CreateChatHeadModel {
  int? uId;
  int? customerId;

  CreateChatHeadModel({this.uId, this.customerId});

  CreateChatHeadModel.fromSnapShot(DocumentSnapshot snapshot) {
    uId = int.parse(snapshot.id);
    customerId = snapshot['CustomerId'];
  }

  Map<String, dynamic> toSnapShot() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UId'] = uId;
    data['CustomerId'] = customerId;
    return data;
  }
}
