part of 'appointment_document_bloc.dart';

abstract class AppointmentDocumentState {}

class AppointmentDocumentInitialState extends AppointmentDocumentState {}

class AppointmentDocumentLoadingState extends AppointmentDocumentState {}

class AppointmentDocumentLoadedState extends AppointmentDocumentState {
  List<AppointmentDocumentModel> model;
  AppointmentDocumentLoadedState({required this.model});
}

class AppointmentSuccessState extends AppointmentDocumentState {
  SuccessModel model;
  AppointmentSuccessState({required this.model});
}

class AppointmentDocumentErrorState extends AppointmentDocumentState {
  ErrorModel model;
  AppointmentDocumentErrorState({required this.model});
}
