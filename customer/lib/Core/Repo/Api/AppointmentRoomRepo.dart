import '../../../Core/Repo/Api/Base/RepoBase.dart';
import 'package:http/http.dart' as http;

class AppointmentRoomRepo extends RepoBase {
  final createAppointRoom = 'AppointmentRoom/Insert';
  final getByAppointmentId = 'AppointmentRoom/GetByAppointmentId';
  final deleteAppointmentRoom = 'AppointmentRoom/Delete';

}
