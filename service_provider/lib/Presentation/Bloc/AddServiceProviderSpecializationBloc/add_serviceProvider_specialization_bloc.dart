import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SpecializationModel/AddServiceProviderSpecializationModel.dart';
import '../../Controllers/ServiceProviderSpecializationController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'add_serviceProvider_specialization_event.dart';
part 'add_serviceProvider_specialization_state.dart';

class AddServiceProviderSpecializationBloc extends Bloc<AddServiceProviderSpecializationEventBase,
    AddServiceProviderSpecializationStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final serviceProviderSpecializationController = ServiceProviderSpecializationController();

  AddServiceProviderSpecializationBloc() : super(AddServiceProviderSpecializationInitial()) {
    on<AddServiceProviderSpecializationEvent>((event, emit) async {
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, SuccessModel> res =
            await serviceProviderSpecializationController.addSpecialization(
                token: token, model: event.serviceProviderSpecializationModel);
        res.fold((l) => emit(AddServiceProviderSpecializationError()),
            (r) => AddServiceProviderSpecializationSuccess());
      }
    });
  }
}
