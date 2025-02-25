import 'package:dartz/dartz.dart';
import '../../Core/Services/QualificationService.dart';
import '../../Data/Models/QualificationModels/CreateQualificationModel.dart';
import '../../Data/Models/QualificationModels/UpdateQualification.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class QualificationController {
  QualificationService service = QualificationService();
  Future<Either<ErrorModel, SuccessModel>> addQualification(
          CreateQualificationModel model, String token) async =>
      service.addQualification(model, token);

  Future<Either<ErrorModel, SuccessModel>> updateQualification(
          UpdateQualificationModel model, String token) async =>
      service.updateQualification(model, token);
}
