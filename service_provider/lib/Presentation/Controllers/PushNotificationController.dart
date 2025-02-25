import '../../Core/Services/PushNotificationServie.dart';
import '../../Data/Models/PushNotificationModel/PushNotificationModel.dart';

class PushNotificationController {
  final service = PushNotificationService();
  setNotification(PushNotificationModel model) =>
      service.setNotification(model);

  Future<String> getFCMToken() async => service.getFCMToken();
  Future<void> setToken(String userId, String fcmToken) async =>
      service.setToken(userId, fcmToken);
}
