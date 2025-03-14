import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:mended_soluctions/Core/Repo/Api/insurance_repo.dart';
import 'package:mended_soluctions/Data/Models/insurance_model/create_insurance_model.dart';
import 'package:http/http.dart' as http;
import 'package:mended_soluctions/Data/Models/insurance_model/insurance_model.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class InsuranceService {
  final _insuranceRepo = InsuranceRepo();

  Future<Either<ErrorModel, SuccessModel>> createInsurance(
      CreateInsuranceModel model, String token) async {
    http.Response response = await _insuranceRepo.post(
        url: _insuranceRepo.createInsurance,
        token: token,
        body: model.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Created!"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, InsuranceModel>> getInsurance(String token) async {
    http.Response response = await _insuranceRepo.get(
        url: _insuranceRepo.getInsurance, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);
      return right(InsuranceModel.fromJson(res));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
