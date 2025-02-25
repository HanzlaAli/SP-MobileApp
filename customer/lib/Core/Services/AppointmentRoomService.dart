import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/AppointmentRoomRepo.dart';

class AppointmentRoomService {
  AppointmentRoomRepo repo = AppointmentRoomRepo();

  Future<Either<ErrorModel, AppoinmentRoomResponseModel>>
      getRoomByAppointmentId(int id, String token) async {
    Map map = {"appointmantId": id};
    Response response =
        await repo.post(token: token, url: repo.getByAppointmentId, body: map);
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(
          AppoinmentRoomResponseModel.fromJson(json.decode(response.body)));
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }
}
