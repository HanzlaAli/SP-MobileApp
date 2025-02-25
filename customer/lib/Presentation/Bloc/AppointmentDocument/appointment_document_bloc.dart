import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../Data/Models/AppointmentDocument/AppointmentDocument.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/AppoinmentDocumentControlle.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'appointment_document_events.dart';
part 'appointment_document_state.dart';

class AppointmentDocumentBloc
    extends Bloc<AppointmentDocumentEvent, AppointmentDocumentState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appointmentDocumentController = AppoinmentDocumentController();

  AppointmentDocumentBloc() : super(AppointmentDocumentInitialState()) {
    on<GetAllAppointmentDocumentsEvent>(
      (event, emit) async {
        String? token = await sharedPrefrenceController.getToken();
        if (token == null) {
          emit(AppointmentDocumentErrorState(
              model: ErrorModel(message: "Plese Login again")));
        } else {
          Either<ErrorModel, List<AppointmentDocumentModel>> result =
              await appointmentDocumentController.getAppoinmentByCustomer(
                  token, event.date);

          result.fold((l) => emit(AppointmentDocumentErrorState(model: l)),
              (r) => emit(AppointmentDocumentLoadedState(model: r)));
        }
      },
    );
  }
}
