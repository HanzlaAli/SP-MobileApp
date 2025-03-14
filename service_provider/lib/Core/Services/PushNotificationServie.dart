import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../Data/Models/PushNotificationModel/PushNotificationModel.dart';
import '../Repo/Api/PushNotificationRepo.dart';

class PushNotificationService {
  PushNotificationRepo repo = PushNotificationRepo();
  setNotification(PushNotificationModel model) {
    repo.sendNotification(model);
  }

  Future<String> getFCMToken() async {
    return await FirebaseMessaging.instance.getToken() ?? "";
  }

  Future<void> setToken(String userId, String fcmToken) async {
    // await FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(userId)
    //     .update({"FcmToken": fcmToken});
  }
}
