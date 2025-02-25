part of 'appointment_document_bloc.dart';

abstract class AppointmentDocumentEvent {}

class GetAllAppointmentDocumentsEvent extends AppointmentDocumentEvent {
  DateTime? date;
  GetAllAppointmentDocumentsEvent({required this.date});
}
