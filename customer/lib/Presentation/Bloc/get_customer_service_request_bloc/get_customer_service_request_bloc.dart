import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Core/Services/CustomerRequestService.dart';
import '../../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_customer_service_request_event.dart';
part 'get_customer_service_request_state.dart';

class GetCustomerServiceRequestBloc extends Bloc<GetCustomerServiceRequestEvent,
    GetCustomerServiceRequestState> {
  GetCustomerServiceRequestBloc() : super(GetCustomerServiceRequestInitial()) {
    final sharedPrefrenceController = SharedPrefrenceController();
    final customerRequestService = CustomerRequestService();

    on<GetAllCustomerServiceRequestByCustomerEvent>((event, emit) async {
      emit(GetCustomerServiceRequestLoading());

      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, List<CustomerRequestServiceModel>> res =
            await customerRequestService.getCustomerRequestedServices(
                token, event.filter);
        res.fold((l) => emit(GetCustomerServiceRequestError(model: l)), (r) {
          emit(GetCustomerServiceRequestLoaded(model: r));
        });
      }
    });
  }
}
