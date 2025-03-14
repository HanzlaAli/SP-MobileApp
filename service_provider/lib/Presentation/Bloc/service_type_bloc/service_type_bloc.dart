import '../../../Core/Services/service_type_service.dart';
import '../../Controllers/SharedPrefrenceController.dart';
import 'package:bloc/bloc.dart';
import 'service_type_event.dart';
import 'service_type_state.dart';

class ServiceTypeBloc extends Bloc<ServiceTypeEvent, ServiceTypeState> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _serviceType = ServiceTypeService();

  ServiceTypeBloc() : super(ServiceTypeInitialState()) {
    on<GetServiceType>((event, emit) async {
      String? token;
      try {
        token = await _sharedPrefrenceController.getToken();
        if (token != null) {
          var res = await _serviceType.getTherapyType(token);
          res.fold((l) => emit((ServiceTypeErrorState())),
              (r) => emit(ServiceTypeLoadedState(model: r)));
        } else {
          emit(ServiceTypeErrorState());
        }
      } catch (e) {
        emit(ServiceTypeErrorState());
      }
    });
  }
}
