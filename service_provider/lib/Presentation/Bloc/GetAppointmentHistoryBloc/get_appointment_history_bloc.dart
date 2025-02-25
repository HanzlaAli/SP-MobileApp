import 'package:bloc/bloc.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Presentation/Controllers/AppoinmentController.dart';
import '../../../Data/Models/AppoinmentModels/AppointmentHistoryOfServiceProviderModel.dart';
import '../../Controllers/ServiceProviderController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_appointment_history_event.dart';
part 'get_appointment_history_state.dart';

class GetAppointmentHistoryBloc
    extends Bloc<GetAppointmentHistoryEvent, GetAppointmentHistoryState> {
  AppoinmentController controller = AppoinmentController();
  final sharedPrefrenceController = SharedPrefrenceController();
  final serviceProviderController = ServiceProviderController();
  GetAppointmentHistoryBloc() : super(GetAppointmentHistoryInitial()) {
    on<GetAppointmentHistory>((event, emit) async {
      emit(GetAppointmentHistoryLoading());
      String? token = await sharedPrefrenceController.getToken();
      if (token == null) {
        return;
      }
      var response = await controller.getAppointmentHistory(token);

      response.fold((l) => emit(GetAppointmentHistoryError()),
          (r) => emit(GetAppointmentHistoryLoaded(model: r)));
    });
  }
}
