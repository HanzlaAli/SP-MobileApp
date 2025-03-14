import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Core/Services/insurance_service.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/insurance_model/insurance_model.dart';
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
  }
}
