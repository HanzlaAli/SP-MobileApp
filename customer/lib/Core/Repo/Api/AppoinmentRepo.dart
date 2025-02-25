import 'Base/RepoBase.dart';

class AppoinmentRepo extends RepoBase {
  final getCustomerBookedAppoinments = 'Appointment/GetByCustomer';
  final requestForAppoinment = 'AppointmentRequest/Create';
  final getCustomerAppoinmentHistory = 'Appointment/GetHistoryByCustomer';
  final getRequestedAppoinmentsByCustomer = 'AppointmentRequest/GetByCustomer';
  final getAppointmentByServiceProviderId = 'Appointment/GetByServiceProviderId';
  final createAppoinment = 'Appointment/Create';
}
