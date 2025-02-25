import 'package:bloc/bloc.dart';

import '../../../Data/Models/ServicesModels/FilteredServiceRequestModel.dart';
import '../../../Data/Models/ServicesModels/GetAllServicesModel.dart';
import '../../Controllers/ServiceController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_all_services_event.dart';
part 'get_all_services_state.dart';

class GetAllServicesBloc
    extends Bloc<GetAllServicesEventBase, GetAllServicesStateBase> {
  final serviceController = ServiceController();
  final sharedPrefrenceController = SharedPrefrenceController();
  GetAllServicesBloc() : super(GetAllServicesInitial()) {
    on<GetAllServices>(
      (event, emit) async {
        emit(GetAllServicesLoading());

        String? token = await sharedPrefrenceController.getToken();

        if (token != null) {
          var res = await serviceController.getAllServices(token);
          res.fold((l) => emit(GetAllServicesError()),
              (r) => emit(GetAllServicesLoaded(model: r)));
        }
      },
    );
    on<GetFilteredServices>(
      (event, emit) async {
        emit(GetAllServicesLoading());

        String? token = await sharedPrefrenceController.getToken();

        if (token != null) {
          if (event.model != null) {
            var res = await serviceController.getFilteredServices(
                token, event.model!);
            res.fold((l) => emit(GetAllServicesError()),
                (r) => emit(GetAllServicesLoaded(model: r)));
          } else {
            var res = await serviceController.getAllServices(token);
            res.fold((l) => emit(GetAllServicesError()),
                (r) => emit(GetAllServicesLoaded(model: r)));
          }
        }
      },
    );
    on<SearchService>(
      (event, emit) async {
        emit(GetAllServicesLoaded(model: event.model, val: event.val));
      },
    );
  }
}
