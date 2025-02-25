import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../../Presentation/Controllers/AppoinmentController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_serviceProvider_appoinments_event.dart';
part 'get_serviceProvider_appoinments_state.dart';

class GetServiceProviderAppoinmentsBloc
    extends Bloc<GetServiceProviderAppoinmentsEventBase, GetServiceProviderAppoinmentsStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appoinmentService = AppoinmentController();

  GetServiceProviderAppoinmentsBloc() : super(GetServiceProviderAppoinmentsInitial()) {
    on<GetServiceProviderAppoinments>((event, emit) async {
      emit(GetServiceProviderAppoinmentsLoading());
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, List<GetServiceProviderAppoinmentsModel>> res =
            await appoinmentService.getBookedAppoinments(token, event.model!);
        res.fold((l) => emit(GetServiceProviderAppoinmentsError()),
            (r) => emit(GetServiceProviderAppoinmentsLoaded(model: r)));
      }
    });
  }
}
