import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/TherapyModels/GetServiceProviderTherapyModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/ServiceProviderTherapyController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_serviceProvider_therapies_event.dart';
part 'get_serviceProvider_therapies_state.dart';

class GetServiceProviderTherapiesBloc
    extends Bloc<GetServiceProviderTherapiesEvent, GetServiceProviderTherapiesState> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _serviceProviderTherapyController = ServiceProviderTherapyController();

  GetServiceProviderTherapiesBloc() : super(GetServiceProviderTherapiesInitial()) {
    on<GetAllServiceProviderTherapies>((event, emit) async {
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, List<GetServiceProviderTherapyModel>> res =
            await _serviceProviderTherapyController.getServiceProviderTherapy(token: token);
        res.fold((l) => emit(GetServiceProviderTherapiesError(errorModel: l)),
            (r) => emit(GetServiceProviderTherapiesLoaded(list: r)));
      }
    });
  }
}
