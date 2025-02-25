// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Data/Models/TherapyModels/AddTherapy.dart';
import '../../../Presentation/Controllers/ServiceProviderTherapyController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'add_serviceProvider_therapy_event.dart';
part 'add_serviceProvider_therapy_state.dart';

class AddServiceProviderTherapyBloc
    extends Bloc<AddServiceProviderTherapyEventBase, AddServiceProviderTherapyStateBase> {
  AddServiceProviderTherapyBloc() : super(AddServiceProviderTherapyInitial()) {
    final sharedPrefrenceController = SharedPrefrenceController();
    final serviceProviderTherapyController = ServiceProviderTherapyController();

    on<AddServiceProviderTherapyEvent>((event, emit) async {
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await serviceProviderTherapyController
            .addServiceProviderTherapy(token: token, model: event.addServiceProviderTherapyModel);
        res.fold((l) => emit(AddServiceProviderTherapyError()),
            (r) => AddServiceProviderTherapySuccess());
      }
    });
  }
}
