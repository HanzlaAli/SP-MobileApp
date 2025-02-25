import '../../../Core/Repo/Api/Base/RepoBase.dart';
import 'package:http/http.dart' as http;

class AppointmentRoomRepo extends RepoBase {
  final createAppointRoom = 'AppointmentRoom/Insert';
  final getByAppointmentId = 'AppointmentRoom/GetByAppointmentId';
  final deleteAppointmentRoom = 'AppointmentRoom/Delete';
  Future<http.Response> generateToken(String channelName) async {
    try {
      http.Response response = await http.get(
          headers: {
            "Access-Control-Allow-Origin":
                "*", // Required for CORS support to work
            "Access-Control-Allow-Methods": "GET, OPTIONS"
          },
          Uri.parse(
              'https://agora-node-tokenserver-1.hanzlaali1.repl.co/access_Token?channelName=$channelName'));

      return response;
    } catch (e) {
      print(e.toString());
      return http.Response('', 500);
    }
  }
}
