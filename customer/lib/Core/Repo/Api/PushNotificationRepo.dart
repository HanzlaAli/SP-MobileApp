import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../Data/Models/PushNotificationModel/PushNotificationModel.dart';
import 'Base/RepoBase.dart';

class PushNotificationRepo extends RepoBase {
  final _serverToken =
      'AAAAssIdQGM:APA91bH9NA3Hob1BA6a6o4mxlD7ckbKSKe0q4miNOpVY5S40FkYdPtgC6B37yoTy-DkiEAT4NE0T8tLXIOPekFTXHqouxbUn0HTeq8czHrS9j0GG8X97WnGTv0WiLUY2w59fqG4lq5LR';
  final fcmUrl = 'https://fcm.googleapis.com/fcm/send';
  Future<void> sendNotification(PushNotificationModel model) async {
    http.Response res = await http
        .post(Uri.parse(fcmUrl), body: json.encode(model.toJson()), headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "key=$_serverToken"
    });
  }
}
