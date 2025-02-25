import 'package:bloc/bloc.dart';
import '../../../Data/Models/ServicesModels/GetAllServicesModel.dart';
import '../../../Data/Models/ServicesModels/GetServiceProviderServiceRequestModel.dart';

import '../../Controllers/ServiceController.dart';
import '../../Controllers/SharedPrefrenceController.dart';

part 'get_services_by_serviceProvider_event.dart';
part 'get_services_by_serviceProvider_state.dart';

class GetServicesByServiceProviderBloc
    extends Bloc<GetServicesByServiceProviderEventBase, GetServicesByServiceProviderStateBase> {
  final serviceController = ServiceController();
  final sharedPrefrenceController = SharedPrefrenceController();

  GetServicesByServiceProviderBloc() : super(GetServicesByServiceProviderInitial()) {
    on<GetServiceProviderServices>((event, emit) async {
      emit(GetServicesByServiceProviderLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token !=null) {
        var res = await serviceController.getAllServices(token);
        res.fold((l) => emit(GetServicesByServiceProviderError()),
            (r) => emit(GetServicesByServiceProviderLoaded(model: r)));
      }
    });
  }
}
