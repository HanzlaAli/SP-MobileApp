import 'package:dartz/dartz.dart';
import '../../../Data/Models/DocumentModels/CreateAppointmentDocumentModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Data/Models/AppointmentDocument/AppointmentDocumentModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/AppointmentDocuemntController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'appointment_document_events.dart';
part 'appointment_document_state.dart';

class AppointmentDocumentBloc
    extends Bloc<AppointmentDocumentEvent, AppointmentDocumentState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appointmentDocumentController = AppointmentDocumentController();

  AppointmentDocumentBloc() : super(AppointmentDocumentInitialState()) {
    on<GetAllAppointmentDocumentsEvent>(
      (event, emit) async {
        String? token = await sharedPrefrenceController.getToken();
        if (token == null) {
          emit(AppointmentDocumentErrorState(
              model: ErrorModel(message: "Plese Login again")));
        } else {
          Either<ErrorModel, List<AppointmentDocumentModel>> result =
              await appointmentDocumentController.getDocuemnt(
                  token, event.date);

          result.fold((l) => emit(AppointmentDocumentErrorState(model: l)),
              (r) => emit(AppointmentDocumentLoadedState(model: r)));
        }
      },
    );
    on<CreateAppointmentDocumentsEvent>(
      (event, emit) async {
        String? token = await sharedPrefrenceController.getToken();
        if (token == null) {
          emit(AppointmentDocumentErrorState(
              model: ErrorModel(message: "Plese Login again")));
        } else {
          Either<ErrorModel, SuccessModel> result =
              await appointmentDocumentController.createDocument(
                  event.model, token);

          result.fold((l) => emit(AppointmentDocumentErrorState(model: l)),
              (r) => emit(AppointmentSuccessState(model: r)));
        }
      },
    );
  }
}
