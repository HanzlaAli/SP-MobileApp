import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/AppoinmentController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_serviceProvider_appoinments_event.dart';
part 'get_serviceProvider_appoinments_state.dart';

class GetCustomerAppoinmentsBloc
    extends Bloc<GetServiceProviderAppoinmentsEventBase, GetServiceProviderAppoinmentsStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appoinmentService = AppoinmentController();

  GetCustomerAppoinmentsBloc() : super(GetServiceProviderAppoinmentsInitial()) {
    on<GetServiceProviderAppoinments>((event, emit) async {
      emit(GetServiceProviderAppoinmentsLoading());
      String? token = await sharedPrefrenceController.getToken();

      String? experiation =
          await sharedPrefrenceController.getTokenExpiration();
      if (token != null) {
        Either<ErrorModel, List<GetCustomerAppoinmentsModel>> res =
            await appoinmentService.getBookedAppoinments(token, event.model!);
        res.fold((l) => emit(GetServiceProviderAppoinmentsError()),
            (r) => emit(GetServiceProviderAppoinmentsLoaded(model: r)));
      }
    });
  }
}
