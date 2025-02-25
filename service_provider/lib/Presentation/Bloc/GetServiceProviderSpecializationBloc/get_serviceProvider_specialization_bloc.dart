import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SpecializationModel/GetSpecialization.dart';
import '../../../Presentation/Controllers/ServiceProviderSpecializationController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_serviceProvider_specialization_event.dart';
part 'get_serviceProvider_specialization_state.dart';

class GetServiceProviderSpecializationBloc extends Bloc<GetServiceProviderSpecializationEventBase,
    GetServiceProviderSpecializationStateBase> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _serviceProviderSpecializationController = ServiceProviderSpecializationController();
  GetServiceProviderSpecializationBloc() : super(GetServiceProviderSpecializationInitial()) {
    on<GetServiceProviderSpecializationEventBase>((event, emit) async {
      String? token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, List<GetSpecializationModel>> res =
            await _serviceProviderSpecializationController.getSpecialization(
                token: token);
        res.fold(
            (l) => emit(GetServiceProviderSpecializationError(errorModel: l)),
            (r) =>
                emit(GetServiceProviderSpecializationLoaded(getSpecializationModel: r)));
      }
    });
  }
}
