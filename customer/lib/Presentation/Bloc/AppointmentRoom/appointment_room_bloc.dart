import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
import '../../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/AppointmentRoomController.dart';

import '../../Controllers/ServiceProviderController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'appointment_room_event.dart';
part 'appointment_room_state.dart';

class AppointmentRoomBloc
    extends Bloc<AppointmentRoomEvent, AppointmentRoomState> {
  AppointmentRoomController controller = AppointmentRoomController();
  final sharedPrefrenceController = SharedPrefrenceController();
  final serviceProviderController = ServiceProviderController();

  AppointmentRoomBloc() : super(AppointmentRoomInitial()) {
    on<GetAppointMentRoomByAppointmentId>((event, emit) async {
      String? token = await sharedPrefrenceController.getToken();
      Either<ErrorModel, UserModel> response = await serviceProviderController
          .getServiceProviderByIdFromFirebase(event.serviceProviderId.toString());
      if (response.isRight()) {
        var model;
        response.fold((l) => null, (r) {
          model = r;
        });
        if (model != null && model.isActive == true) {
          if (token != null) {
            Either<ErrorModel, AppoinmentRoomResponseModel> res =
                await controller.getRoomByAppointmentId(event.id!, token);
            res.fold((l) => emit(AppointmentRoomError()),
                (r) => emit(AppointmentRoomSuccess(model: r)));
          } else {
            emit(AppointmentRoomError());
          }
        } else {
          emit(AppointmentRoomError(
              model: ErrorModel(message: "User is Offline", code: 503)));
        }
      } else {
        emit(AppointmentRoomError());
      }
    });
  }
}
