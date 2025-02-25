import 'package:dartz/dartz.dart';
import '../../Core/Services/DocumentService.dart';
import '../../Data/Models/AppointmentDocument/AppointmentDocumentModel.dart';
import '../../Data/Models/DocumentModels/CreateAppointmentDocumentModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class AppointmentDocumentController {
  DocumentService service = DocumentService();
  Future<Either<ErrorModel, SuccessModel>> createDocument(
          CreateAppointmentDocumentsModel model, String token) async =>
      service.createDocument(model, token);

  Future<Either<ErrorModel, List<AppointmentDocumentModel>>> getDocuemnt(
          String token,DateTime? date) async =>
      await service.getAppoinmentByServiceProvider(token,date);
}
