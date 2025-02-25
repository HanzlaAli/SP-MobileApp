import 'package:dartz/dartz.dart';
import '../../Core/Services/AppointmentRoomService.dart';
import '../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class AppointmentRoomController {
  final _service = AppointmentRoomService();

  Future<Either<ErrorModel, AppoinmentRoomResponseModel>>
      getRoomByAppointmentId(int id, String token) async =>
          _service.getRoomByAppointmentId(id, token);
}
