import 'package:bloc/bloc.dart';
import '../../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
import '../../Controllers/ServiceProviderController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_serviceProviders_event.dart';
part 'get_serviceProviders_state.dart';

class GetServiceProvidersBloc extends Bloc<GetServiceProvidersEventBase, GetServiceProvidersStateBase> {
  final serviceProviderController = ServiceProviderController();
  final sharedPrefrenceController = SharedPrefrenceController();

  GetServiceProvidersBloc() : super(GetServiceProvidersInitial()) {
    on<GetAllServiceProviders>((event, emit) async {
      emit(GetServiceProvidersLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        var res = await serviceProviderController.getServiceProviders(token);
        res.fold((l) => emit((GetServiceProvidersError())),
            (r) => emit(GetServiceProvidersLoaded(model: r)));
      }
    });
  }
}
