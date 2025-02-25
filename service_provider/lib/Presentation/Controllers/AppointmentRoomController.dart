import 'package:dartz/dartz.dart';
import '../../Core/Services/AppointmentRoomService.dart';
import '../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
import '../../Data/Models/AppointmentRoomModel/CreateAppointmentRoomModel.dart';
import '../../Data/Models/AppointmentRoomModel/GenerateChannelModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class AppointmentRoomController {
  final _service = AppointmentRoomService();
  Future<Either<ErrorModel, AppoinmentRoomResponseModel>> createAppoinment(
          CreateAppointmentRoomModel model, String token) async =>
      _service.createAppoinment(model, token);

  Future<Either<ErrorModel, SuccessModel>> getRoomByAppointmentId(
          String id) async =>
      _service.getRoomByAppointmentId(id);

  Future<Either<ErrorModel, GenerateChannelModel>> generateToken(
          String channelName) async =>
      _service.generateToken(channelName);
}
