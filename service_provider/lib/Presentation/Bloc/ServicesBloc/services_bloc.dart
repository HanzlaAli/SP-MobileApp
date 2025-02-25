import 'package:bloc/bloc.dart';
import '../../../Data/Models/ServiceProvider/GetServiceProviderServiceRequestModel.dart';
import '../../../Data/Models/ServicesModels/AddServiceModel.dart';
import '../../../Data/Models/ServicesModels/DeleteServicesModel.dart';
import '../../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../../Data/Models/ServicesModels/UpdateServiceModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Presentation/Controllers/ServiceController.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEventBase, ServicesStateBase> {
  final serviceController = ServiceController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  var emptyModel = GetServiceProviderServicesReuqestModel(serviceProviderEmail: "");
  ServicesBloc() : super(ServicesInitial()) {
    on<AddNewService>((event, emit) async {
      emit(ServicesBlocLoading(
        isSuccess: true,
      ));
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await serviceController.addService(event.model!, token);
        var result = await serviceController.getServices(token, emptyModel);
        result.fold(
            (l) => emit(ServicesError(
                  isSuccess: true,
                )),
            (r) => emit(ServicesLoaded(
                list: r,
                successModel:
                    SuccessModel(message: "Service Added!", code: 200))));
        // if (res.isRight()) {
        // } else {
        //   emit(ServicesError(
        //     isSuccess: true,
        //   ));
        // }
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
    on<UpdateService>((event, emit) async {
      emit(ServicesBlocLoading(
        isSuccess: true,
      ));
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await serviceController.updateService(event.model!, token);
        if (res.isRight()) {
          var result = await serviceController.getServices(token, emptyModel);
          result.fold(
              (l) => emit(ServicesError(
                    isSuccess: true,
                  )),
              (r) => emit(ServicesLoaded(
                  list: r,
                  successModel:
                      SuccessModel(message: "Service Updated!", code: 200))));
        } else {
          emit(ServicesError(
            isSuccess: true,
          ));
        }
      }
    });
  }
}
