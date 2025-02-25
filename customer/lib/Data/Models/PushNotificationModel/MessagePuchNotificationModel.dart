import 'NotificationModel.dart';
class MessagePushNotificationModel {
  Notification? notification;
  Data? data;

  MessagePushNotificationModel({this.notification, this.data});

  MessagePushNotificationModel.fromJson(Map<String, dynamic> json) {
    notification = json['notification'] != null
        ? Notification.fromJson(json['notification'])
        : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}



class Data {
  String? notificationType;
  int? senderId;
  int? reciverId;
  String? senderName;
  String? reciverName;
  String? senderProfilePicture;

  Data(
      {this.notificationType,
      this.senderId,
      this.reciverId,
      this.senderName,
      this.reciverName,
      this.senderProfilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    notificationType = json['notificationType'];
    senderId = json['senderId'];
    reciverId = json['reciverId'];
    senderName = json['SenderName'];
    reciverName = json['ReciverName'];
    senderProfilePicture = json['SenderProfilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationType'] = notificationType;
    data['senderId'] = senderId;
    data['reciverId'] = reciverId;
    data['SenderName'] = senderName;
    data['ReciverName'] = reciverName;
    data['SenderProfilePicture'] = senderProfilePicture;
    return data;
  }
}
