// ignore_for_file: file_names, depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/Repo/Api/LogInRepo.dart';
import '../../Data/Models/UserModels/AuthModel.dart';
import '../../Data/Models/UserModels/LogInModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import 'package:dartz/dartz.dart';
import '../../Data/Models/UserModels/RefreshTokenRequestModel.dart';

class LogInServices {
  final _logInRepo = LogInRepo();
  Future<Either<ErrorModel, AuthModel>> logIn(LogInModel logInModel) async {
    try {
      http.Response response = await _logInRepo.post(
          url: _logInRepo.loginCustomer, body: logInModel.toJson());
      var res = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(AuthModel.fromJson(json.decode(response.body)));
      } else {
        return left(ErrorModel(message: res['message']));
      }
    } catch (e) {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, AuthModel>> refreshToken(
      RefreshTokenModel model) async {
    http.Response response = await _logInRepo.post(
        url: _logInRepo.refreshToken, body: model.toJson());
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(AuthModel.fromJson(res));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
