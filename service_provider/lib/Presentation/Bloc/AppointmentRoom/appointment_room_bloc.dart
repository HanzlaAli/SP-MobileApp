import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppointmentRoomModel/CreateAppointmentRoomModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Presentation/Controllers/AppointmentRoomController.dart';
import '../../../Data/Models/AppointmentRoomModel/AppointmentRoomResponse.dart';
import '../../../Data/Models/FireBaseUserModel/UserModel.dart';
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
    on<AddAppointmentRoom>(
      (event, emit) async {
        String? token = await sharedPrefrenceController.getToken();
        Either<ErrorModel, UserModel> response =
            await serviceProviderController.getServiceProviderByIdFromFirebase(event.customerId!);
        if (response.isRight()) {
          var model;
          response.fold((l) => null, (r) {
            model = r;
          });
          if (model != null && model.isActive == true) {
            if (token != null) {
              Either<ErrorModel, AppoinmentRoomResponseModel> response =
                  await controller.createAppoinment(event.model!, token);
              response.fold(
                  (l) => emit(
                        AppointmentRoomError(),
                      ),
                  (r) => emit(
                        AppointmentRoomCreated(model: r),
                      ));
            } else {
              emit(AppointmentRoomError());
            }
          } else {
            emit(
              AppointmentRoomError(
                model: ErrorModel(message: "User is Offline", code: 503),
              ),
            );
          }
        }
      },
    );
  }
}
