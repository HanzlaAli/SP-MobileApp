// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import '../../Core/Services/LogInService.dart';
import '../../Data/Models/UserModels/AuthModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/UserModels/LogInModel.dart';

import '../../Data/Models/UserModels/RefreshTokenRequestModel.dart';

class LogInController {
  final _logInServices = LogInServices();

  Future<Either<ErrorModel, AuthModel>> login(
          {required LogInModel logInModel}) async =>
      await _logInServices.logIn(logInModel);
  Future<Either<ErrorModel, AuthModel>> refreshToken(
          RefreshTokenModel model) async =>
      _logInServices.refreshToken(model);
}
