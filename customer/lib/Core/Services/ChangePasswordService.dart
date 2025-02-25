import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import 'package:http/http.dart' as http;
import '../../Presentation/Bloc/UserModels/ChangePasswordModel.dart';
import '../Repo/Api/ChangePasswordRepo.dart';

class ChangePasswordService {
  final _changePasswordRepo = ChangePasswordRepo();

  Future<Either<ErrorModel, SuccessModel>> changePassword(
      ChangePasswordModel changePasswordModel, String token) async {
    http.Response response = await _changePasswordRepo.post(
        url: _changePasswordRepo.changePassword,
        body: changePasswordModel.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Password Changed"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
