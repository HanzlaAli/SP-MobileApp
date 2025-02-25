import '../../../Core/Repo/Api/Base/RepoBase.dart';

class DocumentRepo extends RepoBase {
  final createDocument = 'AppointmentDocument/Create';
  final updateDocument = 'AppointmentDocument/Update';
  final getDocument = 'AppointmentDocument/GetList';
  final getDocumentByServiceProvider = 'AppointmentDocument/GetAppointmentServiceProvider';
}
