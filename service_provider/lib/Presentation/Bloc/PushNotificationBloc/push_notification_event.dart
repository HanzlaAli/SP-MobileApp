part of 'push_notification_bloc.dart';

abstract class PushNotificationEvent {}

class SendMessageNotification extends PushNotificationEvent {
  MessagePushNotificationModel? model;
  SendMessageNotification({this.model});
}

class SendVideoCallJoiningNotification extends PushNotificationEvent {
  VideoCallPushNotificationModel? model;
  SendVideoCallJoiningNotification({this.model});
}
