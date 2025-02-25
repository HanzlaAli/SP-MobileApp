// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/VerificationModel/AddNewPasswordModel.dart';
import '../../Data/Models/VerificationModel/ForgetPasswordModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/ForgetPasswordRepo.dart';

class ForgetpasswordService {
  final _forgetPasswordRepo = ForgetPasswordRepo();
  Future<Either<ErrorModel, SuccessModel>> forgetPassword(
      ForgetPasswordModel forgetPasswordModel) async {
    http.Response res = await _forgetPasswordRepo.post(
      url: _forgetPasswordRepo.forgetPasswordUrl,
      body: forgetPasswordModel.toJson(),
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      return right(SuccessModel(
          code: 200, message: "Password has been sent to your email"));
    } else {
      return left(ErrorModel(
          code: 200, message: "Something went wrong please try again"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> addNewPassword(
      AddNewPasswordModel addNewPasswordModel) async {
    http.Response res = await _forgetPasswordRepo.post(
      url: _forgetPasswordRepo.addNewPassword,
      body: addNewPasswordModel.toJson(),
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Password Changed"));
    } else {
      return left(ErrorModel(
          code: 200, message: "Something went wrong please try again"));
    }
  }
}
