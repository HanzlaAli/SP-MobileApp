import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
 
class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('MendedSolutions');
    final DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      // onDidReceiveLocalNotification: (id, title, body, payload) async {
      //   // Handle notification tap on iOS
      // },
    );
    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {
      if (notificationResponse != null) {
        // Navigator.of(context).pushNamed(route);
      } // ...
      //    (String route) async {
    });

    notificationTapBackground;
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // handle action
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
      const andoridNotification = AndroidNotificationDetails(
        "YousufMobiles",
        "My  channel",
        importance: Importance.max,
        priority: Priority.high,
      );
      const NotificationDetails notificationDetails = NotificationDetails(
          android: andoridNotification, iOS: iOSPlatformChannelSpecifics);

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}
