import 'package:bloc/bloc.dart';
import '../../../Presentation/Controllers/AppoinmentController.dart';
import '../../../Data/Models/AppoinmentModels/GetCustomerRequestedAppointmentsModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_requested_appoinments_of_customer_event.dart';
part 'get_requested_appoinments_of_customer_state.dart';

class GetRequestedAppoinmentsOfCustomerBloc extends Bloc<
    GetRequestedAppoinmentsOfCustomerEventBase,
    GetRequestedAppoinmentsOfCustomerStateBase> {
  final appoinmentController = AppoinmentController();
  final sharedPrefrenceController = SharedPrefrenceController();

  GetRequestedAppoinmentsOfCustomerBloc()
      : super(GetRequestedAppoinmentsOfCustomerInitial()) {
    on<GetAllRequestedAppoinments>((event, emit) async {
      emit((GetRequestedAppoinmentsOfCustomerLoading()));
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res =
            await appoinmentController.getRequestedAppoinmentOfCustomer(token);
        res.fold((l) => emit((GetRequestedAppoinmentsOfCustomerError())),
            (r) => emit(GetRequestedAppoinmentsOfCustomerLoaded(model: r)));
      }
    });
  }
}
