import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Core/Services/complaint_service.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Data/Models/complaint_models/add_complaint_model.dart';
import '../../../Data/Models/complaint_models/complaint_model.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'complaint_event.dart';
part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final complaintService = ComplaintService();

  ComplaintBloc() : super(ComplaintInitial()) {
    on<CreateComplaintEvent>((event, emit) async {
      emit(ComplaintLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, SuccessModel> response =
            await complaintService.createComplaint(event.model, token);

        response.fold((l) => emit(ComplaintError(errorModel: l)),
            (r) => emit(ComplaintSuccess(model: r)));
      }
    });

    on<GetComplaintEvent>((event, emit) async {
      emit(ComplaintLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, List<ComplaintModel>> response =
            await complaintService.getComplaint(token);
        response.fold((l) => emit(ComplaintError(errorModel: l)),
            (r) => emit(ComplaintLoaded(model: r)));
      }
    });
  }
}
