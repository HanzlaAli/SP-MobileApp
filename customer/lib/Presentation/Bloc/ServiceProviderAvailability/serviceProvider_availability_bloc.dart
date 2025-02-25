import 'package:bloc/bloc.dart';
import '../../../Data/Models/ServiceProviderAvailabilityModel/ServiceProviderAvailabilityModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/ServiceProviderAvailabilityController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'serviceProvider_availability_event.dart';
part 'serviceProvider_availability_state.dart';

class ServiceProviderAvailabilityBloc
    extends Bloc<ServiceProviderAvailabilityEvent, ServiceProviderAvailabilityState> {
  final controller = ServiceProviderAvailabilityController();
  final _sharedPrefrenceController = SharedPrefrenceController();

  ServiceProviderAvailabilityBloc() : super(ServiceProviderAvailabilityInitial()) {
    on<GetServiceProviderAvailabilityEvent>((event, emit) async {
      var token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        emit(ServiceProviderAvailabilityLoading());
        var result = await controller.getServiceProviderAvailabilotyByServiceProviderId(
            token, event.serviceProviderId, event.weekDay);
        result.fold((l) => emit(ServiceProviderAvailabilityError()),
            (r) => emit(ServiceProviderAvailabilityLoaded(list: r)));
      }
    });
  }
}
