// ignore_for_file: file_names

import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mended_soluctions/Presentation/helper/enums/insurance_type.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../firebase_options.dart';
import 'Constants/Constants.dart';
import 'LocalNotificationsInitialization.dart';
import 'enums/complaint_status.dart';

void localNotificationInit(BuildContext context) {
  LocalNotificationService.initialize(context);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LocalNotificationService.display(message);
  });
}

setNotifications() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  try {
    FirebaseMessaging.instance.getInitialMessage();
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}
  } catch (e) {
    print(e.toString());
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

String dateTimetoDateConverter(DateTime dateTime, {String format = 'yyyy-dd-MM'}) {
  return DateFormat(format).format(dateTime);
}

String dateTimetoTimeConverter(DateTime dateTime) {
  return DateFormat('HH:mm').format(dateTime);
}

String convertTo12HourFormat(DateTime time24) {
  final format = DateFormat('HH:mm');
  final time = format.parse(time24.toString());
  return DateFormat('h:mm a').format(time);
}

double getWidth(double mediaQuery) {
  return (kIsWeb
      ? mediaQuery < 800
          ? 300
          : (mediaQuery * 0.3)
      : (mediaQuery * 0.8));
}

int getCount(double mediaQuery) {
  if (mediaQuery >= 1001) {
    return 3;
  } else if (mediaQuery <= 1000 && mediaQuery >= 700) {
    return 2;
  } else {
    return 1;
  }
}

String dateFormatter(String dateTime) {
  var date = DateTime.parse(dateTime);
  var presentDate = DateTime.now();
  if (date.month - presentDate.month == 0) {
    if (date.day - presentDate.day == 0) {
      if (date.minute - presentDate.minute >= 0) {
        if (date.minute - presentDate.minute > 0) {
          return ("${date.minute - presentDate.minute} min");
        } else {
          return "Just Now";
        }
      } else if (presentDate.hour - date.hour >= 0) {
        if (presentDate.hour - date.hour >= 0) {
          return ("1 Hour");
        } else {
          return ("${presentDate.hour - date.hour} hour");
        }
      } else {
        return 'Today';
      }
    } else if (date.day - presentDate.day == 1) {
      return 'Yestarday';
    } else if (date.day - presentDate.day >= 2 &&
        date.day - presentDate.day <= 6) {
      return DateFormat('EEEE').format(date);
    } else {
      return DateFormat('dd-MM').format(date);
    }
  } else {
    return DateFormat('dd-MM').format(date);
  }
}

Future<void> launchDialPad(String phoneNo) async {
  final Uri launchUri = Uri(scheme: 'tel', path: phoneNo);
  await launchUrl(launchUri);
}

List<String> getImages(String image) {
  var images = image.split(';').map((img) => '$baseUrl$img').toList();
  return images;
}

String getComplaintStatusString(int status) {
  if (status < 0 || status >= ComplaintStatus.values.length + 1) {
    return 'Unknown';
  }
  switch (status) {
    case 1:
      return 'Open';
    case 2:
      return 'InProgress';
    case 3:
      return 'Closed';
    default:
      return 'Unknown';
  }
}

String getInsuranceTypeString(int? type) {
  switch (type) {
    case 0:
      return 'General Liability Insurance';
    case 1:
      return 'Workers Compensation Insurance';
    case 2:
      return 'Professional Liability Insurance';
    case 3:
      return 'Tools And Equipment Insurance';
    default:
      return 'Unknown';
  }
}
