import 'package:bloc/bloc.dart';
import '../../../Data/Models/ServiceProvider/GetServiceProviderServiceRequestModel.dart';
import '../../../Data/Models/ServicesModels/create_or_edit_service_model.dart';
import '../../../Data/Models/ServicesModels/DeleteServicesModel.dart';
import '../../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../../Data/Models/ServicesModels/delete_service_image_model.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Presentation/Controllers/ServiceController.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEventBase, ServicesStateBase> {
  final serviceController = ServiceController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  var emptyModel =
      GetServiceProviderServicesReuqestModel(serviceProviderEmail: "");
  ServicesBloc() : super(ServicesInitial()) {
    on<CreateOrUpdateServiceEvent>((event, emit) async {
      emit(ServicesBlocLoading(
        isSuccess: true,
      ));

      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        if (event.model?.id == 0) {
          await serviceController.addService(event.model!, token);
        } else {
          await serviceController.updateService(event.model!, token);
        }

        var result = await serviceController.getServices(token, emptyModel);
        result.fold(
            (l) => emit(ServicesError(
                  isSuccess: true,
                )),
            (r) => emit(ServicesLoaded(
                list: r,
                successModel:
                    SuccessModel(message: "Service Added!", code: 200))));
      }
    });
    on<GetAllService>((event, emit) async {
      emit(ServicesBlocLoading(
        isSuccess: false,
      ));
      String? token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        var result = await serviceController.getServices(token, emptyModel);
        result.fold(
            (l) => emit(ServicesError(
                  isSuccess: false,
                )),
            (r) => emit(ServicesLoaded(list: r, successModel: null)));
      }
    });
    on<DeleteService>((event, emit) async {
      emit(ServicesBlocLoading(
        isSuccess: true,
      ));
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await serviceController.deleteService(event.model!, token);
        if (res.isRight()) {
          var result = await serviceController.getServices(token, emptyModel);
          result.fold(
              (l) => emit(ServicesError(
                    isSuccess: true,
                  )),
              (r) => emit(ServicesLoaded(
                  list: r,
                  successModel:
                      SuccessModel(message: "Service Deleted!", code: 200))));
        } else {
          emit(ServicesError(
            isSuccess: true,
          ));
        }
      }
    });

    on<DeleteServiceImage>((event, emit) async {
      emit(ServicesBlocLoading(
        isSuccess: true,
      ));
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res =
            await serviceController.deleteServiceImage(event.model!, token);
        if (res.isRight()) {
          var result = await serviceController.getServices(token, emptyModel);
          result.fold(
              (l) => emit(ServicesError(
                    isSuccess: true,
                  )),
              (r) => emit(ServicesLoaded(
                  list: r,
                  successModel:
                      SuccessModel(message: "Service Deleted!", code: 200))));
        } else {
          emit(ServicesError(
            isSuccess: true,
          ));
        }
      }
    });
  }
}
