import '../../../Core/Repo/Api/Base/RepoBase.dart';

class AppoinmentRepo extends RepoBase {
  final getAppoinmentType = 'AppointmentType/GetList';
  final createAppoinment = 'Appointment/Create';
  final getServiceProviderBookedAppoinments = 'Appointment/GetByServiceProvider';
  final getServiceProviderAppoinmentHistory = 'Appointment/GetHistoryByServiceProvider';
  final getServiceProviderRequestedAppoinments = 'AppointmentRequest/GetByServiceProvider';
}
