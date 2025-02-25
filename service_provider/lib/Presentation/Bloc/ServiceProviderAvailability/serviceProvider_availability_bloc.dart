import 'package:bloc/bloc.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/CreateServiceProviderAvailabilityModel.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/GetServiceProviderAvailabilityModel.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/UpdateServiceProviderAvailabilityModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/ServiceProviderAvailabilityController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'serviceProvider_availability_event.dart';
part 'serviceProvider_availability_state.dart';

class ServiceProviderAvailabilityBloc
    extends Bloc<ServiceProviderAvailabilityEvent, ServiceProviderAvailabilityState> {
  final controller = ServiceProviderAvailabilityController();
  final _sharedPrefrenceController = SharedPrefrenceController();

  ServiceProviderAvailabilityBloc() : super(ServiceProviderAvailabilityInitial()) {
    on<CreateServiceProviderAvailabilityEvent>((event, emit) async {
      emit(ServiceProviderAvailabilityLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await controller.addServiceProviderAvailability(event.model!, token);
        var result = await controller.getServices(token);
        result.fold(
            (l) => emit(ServiceProviderAvailabilityError()),
            (r) => emit(ServiceProviderAvailabilitySuccess(
                model: SuccessModel(message: "Service Added!", code: 200))));
      }
    });
    on<UpdateServiceProviderAvailabilityEvent>((event, emit) async {
      emit(ServiceProviderAvailabilityLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await controller.updateService(event.model!, token);
        // if (res.isRight()) {
        //   var result = await controller.getServices(token);
        res.fold(
            (l) => emit(ServiceProviderAvailabilityError()),
            (r) => emit(ServiceProviderAvailabilitySuccess(
                model: SuccessModel(message: "Service Added!", code: 200))));
        // } else {
        //   emit(ServicesError(
        //     isSuccess: true,
        //   ));
        // }
      }
    });
    on<DeleteServiceProviderAvailabilityEvent>((event, emit) async {
      emit(ServiceProviderAvailabilityLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await controller.deleteService(event.id!, token);
        // if (res.isRight()) {
        //   var result = await controller.getServices(token);
        res.fold(
            (l) => emit(ServiceProviderAvailabilityError()),
            (r) => emit(ServiceProviderAvailabilitySuccess(
                model: SuccessModel(message: "Service Added!", code: 200))));
        // } else {
        //   emit(ServicesError(
        //     isSuccess: true,
        //   ));
        // }
      }
    });
    on<GetServiceProviderAvailabilityEvent>((event, emit) async {
      emit(ServiceProviderAvailabilityLoading());
      String? token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        var result = await controller.getServices(token);
        result.fold((l) => emit(ServiceProviderAvailabilityError()),
            (r) => emit(ServiceProviderAvailabilityLoaded(list: r)));
      }
    });
  }
}
