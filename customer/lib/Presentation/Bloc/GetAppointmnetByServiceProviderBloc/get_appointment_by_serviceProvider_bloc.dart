import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentResponseModel.dart';
import '../../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentsRequestModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/AppoinmentController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_appointment_by_serviceProvider_event.dart';
part 'get_appointment_by_serviceProvider_state.dart';

class GetAppointmentByServiceProviderBloc
    extends Bloc<GetAppointmentByServiceProviderEvent, GetAppointmentByServiceProviderState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appoinmentService = AppoinmentController();

  GetAppointmentByServiceProviderBloc() : super(GetAppointmentByServiceProviderInitial()) {
    on<GetAppointmentsOfServiceProvider>((event, emit) async {
      emit((GetAppointmentByServiceProviderLoading()));
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, List<GetServiceProviderAppointmentsResponseModel>> res =
            await appoinmentService.getRequestedAppoinmentByServiceProviderId(
                event.model!, token);
        res.fold((l) => emit(GetAppointmentByServiceProviderError()),
            (r) => emit(GetAppointmentByServiceProviderLoaded(model: r)));
      }
    });
  }
}
