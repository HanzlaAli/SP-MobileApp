import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mended_soluctions/Core/Services/insurance_service.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Data/Models/insurance_model/create_insurance_model.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'create_insurance_event.dart';
part 'create_insurance_state.dart';

class CreateInsuranceBloc
    extends Bloc<CreateInsuranceEvent, CreateInsuranceState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final insuranceService = InsuranceService();
  CreateInsuranceBloc() : super(CreateInsuranceInitial()) {
    on<CreateInsurance>((event, emit) async {
      emit(CreateInsuranceLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> response =
            await insuranceService.createInsurance(event.model, token);

        response.fold((l) => emit(CreateInsuranceError(errorModel: l)),
            (r) => emit(CreateInsuranceSuccess(model: r)));
      }
    });
  }
}
