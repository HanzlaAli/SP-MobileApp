import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/QualificationRepo.dart';
import '../../Data/Models/QualificationModels/CreateQualificationModel.dart';
import '../../Data/Models/QualificationModels/UpdateQualification.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class QualificationService {
  QualificationRepo repo = QualificationRepo();

  Future<Either<ErrorModel, SuccessModel>> addQualification(
      CreateQualificationModel model, String token) async {
    http.Response response = await repo.post(
        url: repo.addQualification, body: model.toJson(), token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateQualification(
      UpdateQualificationModel model, String token) async {
    http.Response response = await repo.post(
        url: repo.addQualification, body: model.toJson(), token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }
}
