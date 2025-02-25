// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import '../../Data/Models/UserModels/AuthModel.dart';
import '../../Core/Services/SignUpService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/UserModels/SignUpModel.dart';

class SignUpController {
  final _signUpService = SignUpService();

  Future<Either<ErrorModel, AuthModel>> signUp(
      {required SignUpModel signUpModel}) async {
    Either<ErrorModel, AuthModel> response =
        await _signUpService.signUp(signUpModel);
    return response;
  }
}
