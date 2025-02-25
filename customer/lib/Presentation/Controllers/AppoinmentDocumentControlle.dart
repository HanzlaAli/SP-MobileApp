import 'package:dartz/dartz.dart';
import '../../Core/Services/AppoinmentDocumentService.dart';
import '../../Data/Models/AppointmentDocument/AppointmentDocument.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class AppoinmentDocumentController {
  final service = AppoinmentDocumentService();

  Future<Either<ErrorModel, List<AppointmentDocumentModel>>>
      getAppoinmentByCustomer(String token, DateTime? date) async =>
          service.getBookedAppoinments(token, date);
}
