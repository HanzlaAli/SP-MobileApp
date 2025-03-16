import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:mended_soluctions/Data/Models/SharedModels/SuccessModel.dart';
import 'package:mended_soluctions/Data/Models/insurance_model/create_insurance_model.dart';
import '../../../Core/Services/insurance_service.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/insurance_model/insurance_model.dart';
import '../../../Data/Models/insurance_model/update_insurance_model.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'insurance_event.dart';
part 'insurance_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final insuranceService = InsuranceService();
  InsuranceBloc() : super(InsuranceInitial()) {
    on<GetInsurance>((event, emit) async {
      emit(InsuranceLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, InsuranceModel> response =
            await insuranceService.getInsurance(token);

        response.fold((l) => emit(InsuranceError(errorModel: l)),
            (r) => emit(InsuranceLoaded(model: r)));
      }
    });

    on<CreateInsurance>((event, emit) async {
      emit(InsuranceLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> response =
            await insuranceService.createInsurance(event.model, token);

        response.fold((l) => emit(InsuranceError(errorModel: l)),
            (r) => emit(InsuranceSuccess(model: r)));
      }
    });

    on<UpdateInsurance>((event, emit) async {
      emit(InsuranceLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        await insuranceService.updateInsurance(event.model, token);

        Either<ErrorModel, InsuranceModel> response =
            await insuranceService.getInsurance(token);

        response.fold((l) => emit(InsuranceError(errorModel: l)),
            (r) => emit(InsuranceLoaded(model: r)));
      }
    });
  }
}
