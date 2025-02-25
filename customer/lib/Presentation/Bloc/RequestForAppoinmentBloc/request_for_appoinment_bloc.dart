import 'package:bloc/bloc.dart';
import '../../../Data/Models/AppoinmentModels/CustomerAppoinmentRequestModel.dart';
import '../../../Presentation/Controllers/AppoinmentController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'request_for_appoinment_event.dart';
part 'request_for_appoinment_state.dart';

class RequestForAppoinmentBloc
    extends Bloc<RequestForAppoinmentEventBase, RequestForAppoinmentStateBase> {
  final appoinmentController = AppoinmentController();
  final sharedPrefrenceController = SharedPrefrenceController();

  RequestForAppoinmentBloc() : super(RequestForAppoinmentInitial()) {
    on<RequestForAppoinment>((event, emit) async {
      emit(RequestForAppoinmentLoading());
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        var res = await appoinmentController.requestForAppoinment(
            event.model!, token);
        res.fold((l) => emit(RequestForAppoinmentError()),
            (r) => emit(RequestForAppoinmentSuccess()));
      }
    });
  }
}
