import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/AppointmentRoomRepo.dart';
import '../../Data/Models/AppointmentRoomModel/CreateAppointmentRoomModel.dart';
import '../../Data/Models/AppointmentRoomModel/GenerateChannelModel.dart';
import 'package:http/http.dart';
import '../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class AppointmentRoomService {
  AppointmentRoomRepo repo = AppointmentRoomRepo();
  Future<Either<ErrorModel, AppoinmentRoomResponseModel>> createAppoinment(
      CreateAppointmentRoomModel model, String token) async {
    Response response = await repo.post(
        url: repo.createAppointRoom, body: model.toJson(), token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(
          AppoinmentRoomResponseModel.fromJson(json.decode(response.body)));
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, SuccessModel>> getRoomByAppointmentId(
      String id) async {
    Response response = await repo.get(url: repo.getByAppointmentId);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, GenerateChannelModel>> generateToken(
      String channelName) async {
    Response response = await repo.generateToken(channelName);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(GenerateChannelModel.fromJson(json.decode(response.body)));
    } else {
      return left(ErrorModel());
    }
  }
}
