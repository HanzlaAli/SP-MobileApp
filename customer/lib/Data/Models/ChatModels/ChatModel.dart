import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? snapshotId;
  int? senderId;
  int? reciverId;
  int? uId;
  String? dateTime;
  int? timeSpan;
  String? messageBody;
  bool? isRead;

  ChatModel(
      {this.senderId,
      this.reciverId,
      this.uId,
      this.dateTime,
      this.timeSpan,
      this.messageBody,
      this.isRead});

  ChatModel.fromSnapShot(DocumentSnapshot snapShot) {
    snapshotId = snapShot.id;
    senderId = snapShot['SenderId'];
    reciverId = snapShot['ReciverId'];
    isRead = snapShot['IsRead'];
    uId = snapShot['UId'];
    dateTime = snapShot['DateTime'];
    timeSpan = snapShot['TimeSpan'];
    messageBody = snapShot['MessageBody'];
  }

  Map<String, dynamic> toSnapShot() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SenderId'] = senderId;
    data['ReciverId'] = reciverId;
    data['UId'] = uId;
    data['IsRead'] = isRead;
    data['DateTime'] = dateTime;
    data['TimeSpan'] = timeSpan;
    data['MessageBody'] = messageBody;
    return data;
  }
}
