import 'package:bloc/bloc.dart';
import 'package:customer/Data/Models/CustomerRequestModels/delete_customer_request_image_model.dart';
import 'package:customer/Data/Models/SharedModels/SuccessModel.dart';
import 'package:dartz/dartz.dart';
import '../../../Core/Services/CustomerRequestService.dart';
import '../../../Data/Models/CustomerRequestModels/create_or_update_customer_service_request.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'create_or_edit_customer_service_request_event.dart';
part 'create_or_edit_customer_service_request_state.dart';

class CreateOrEditCustomerServiceRequestBloc extends Bloc<
    CreateOrEditCustomerServiceRequestEvent,
    CreateOrEditCustomerServiceRequestState> {
  CreateOrEditCustomerServiceRequestBloc()
      : super(CreateOrEditCustomerServiceRequestInitial()) {
    final sharedPrefrenceController = SharedPrefrenceController();
    final customerRequestService = CustomerRequestService();
    String _apiUrl = 'http://132.148.73.196:81/api/';
    on<CreateCustomerServiceRequestEvent>((event, emit) async {
      emit(CreateOrEditCustomerServiceRequestLoading());

      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await customerRequestService
            .createCustomerServiceRequest(event.model, token);
        res.fold((l) => emit(CreateOrEditCustomerServiceRequestError(model: l)),
            (r) {
          emit(CreateOrEditCustomerServiceRequestSuccess(model: r));
        });
      }
    });

    on<UpdateCustomerServiceRequestEvent>((event, emit) async {
      emit(CreateOrEditCustomerServiceRequestLoading());

      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await customerRequestService
            .updateCustomerServiceRequest(event.model, token);
        res.fold((l) => emit(CreateOrEditCustomerServiceRequestError(model: l)),
            (r) {
          emit(CreateOrEditCustomerServiceRequestSuccess(model: r));
        });
      }
    });

    on<DeletePictureCustomerServiceRequestEvent>((event, emit) async {
      emit(CreateOrEditCustomerServiceRequestLoading());

      String? token = await sharedPrefrenceController.getToken();
      if (event.model.imagePath != null) {
        var path = event.model.imagePath?.split('/');

        event.model.imagePath = path?.last;
      }
      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await customerRequestService
            .deletePictureCustomerServiceRequest(event.model, token);
        res.fold((l) => emit(CreateOrEditCustomerServiceRequestError(model: l)),
            (r) {
          emit(CreateOrEditCustomerServiceRequestSuccess(model: r));
        });
      }
    });

    on<DeleteCustomerServiceRequestEvent>((event, emit) async {
      emit(CreateOrEditCustomerServiceRequestLoading());

      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await customerRequestService
            .deleteCustomerServiceRequest(event.id, token);
        res.fold((l) => emit(CreateOrEditCustomerServiceRequestError(model: l)),
            (r) {
          emit(CreateOrEditCustomerServiceRequestSuccess(model: r));
        });
      }
    });
  }
}
