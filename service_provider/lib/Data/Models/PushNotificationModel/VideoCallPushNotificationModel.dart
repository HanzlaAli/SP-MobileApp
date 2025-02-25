import 'NotificationModel.dart';

class VideoCallPushNotificationModel {
  Notification? notification;
  Data? data;

  VideoCallPushNotificationModel({this.notification, this.data});

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
  int? customerId;
  String? serviceProviderName;
  String? customerName;
  String? joindUserProfilePicture;

  Data(
      {this.notificationType,
      this.appointmentId,
      this.serviceProviderId,
      this.customerId,
      this.serviceProviderName,
      this.customerName,
      this.joindUserProfilePicture});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notificationType'] = notificationType;
    data['AppointmentId'] = appointmentId;
    data['customerId'] = customerId;
    data['ServiceProviderName'] = serviceProviderName;
    data['CustomerName'] = customerName;
    data['JoindUserProfilePicture'] = joindUserProfilePicture;
    return data;
  }
}
