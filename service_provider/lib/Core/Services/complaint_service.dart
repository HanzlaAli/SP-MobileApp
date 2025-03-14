import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/complaint_models/add_complaint_model.dart';
import '../../Data/Models/complaint_models/complaint_model.dart';
import '../Repo/Api/complaint_repo.dart';

class ComplaintService {
  final complaintRepo = ComplaintRepo();

  Future<Either<ErrorModel, SuccessModel>> createComplaint(
      CreateComplaintModel model, String token) async {
    http.Response response = await complaintRepo.post(
        url: complaintRepo.createComplaint, token: token, body: model.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Created!"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, List<ComplaintModel>>> getComplaint(
      String token) async {
    http.Response response =
        await complaintRepo.get(url: complaintRepo.getComplaint, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List res = jsonDecode(response.body);
      var list = res
          .map((e) => ComplaintModel.fromJson(e))
          .toList()
          .cast<ComplaintModel>();
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
