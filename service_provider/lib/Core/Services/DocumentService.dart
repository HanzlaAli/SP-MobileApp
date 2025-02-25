import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/DocumentRepo.dart';
import '../../Data/Models/DocumentModels/CreateAppointmentDocumentModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/AppointmentDocument/AppointmentDocumentModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import 'package:http/http.dart' as http;

class DocumentService {
  DocumentRepo repo = DocumentRepo();
  Future<Either<ErrorModel, SuccessModel>> createDocument(
      CreateAppointmentDocumentsModel model, String token) async {
    http.Response response = await repo.post(
        url: repo.createDocument, body: model.toJson(), token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, SuccessModel>> getDocument(String token) async {
    http.Response response =
        await repo.post(url: repo.getDocument, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<AppointmentDocumentModel>>>
      getAppoinmentByServiceProvider(String? token, DateTime? date) async {
    http.Response response = await repo.get(
      url: repo.getDocumentByServiceProvider +
          (date == null ? '' : '?Date=${date.toIso8601String()}'),
      token: token,
    );
    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<AppointmentDocumentModel> list = [];
      for (var items in res) {
        list.add(AppointmentDocumentModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }
}
