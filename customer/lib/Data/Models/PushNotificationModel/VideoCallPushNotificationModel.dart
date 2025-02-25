import 'NotificationModel.dart';

class VideoCallPushNotificationModel {
  Notification? notification;
  Data? data;

  VideoCallPushNotificationModel({this.notification, this.data});

  VideoCallPushNotificationModel.fromJson(Map<String, dynamic> json) {
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
  int? appointmentId;
  int? serviceProviderId;
  String? serviceProviderName;
  String? CustomerName;
  String? joindUserProfilePicture;

  Data(
      {this.notificationType,
      this.appointmentId,
      this.serviceProviderId,
      this.serviceProviderName,
      this.CustomerName,
      this.joindUserProfilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    notificationType = json['notificationType'];
    appointmentId = json['AppointmentId'];
    serviceProviderName = json['ServiceProviderName'];
    CustomerName = json['CustomerName'];
    joindUserProfilePicture = json['JoindUserProfilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationType'] = notificationType;
    data['AppointmentId'] = appointmentId;
    data['ServiceProviderName'] = serviceProviderName;
    data['CustomerName'] = CustomerName;
    data['JoindUserProfilePicture'] = joindUserProfilePicture;
    return data;
  }
}
