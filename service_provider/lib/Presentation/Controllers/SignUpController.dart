// ignore_for_file: file_names
import 'package:dartz/dartz.dart';
import '../../Core/Services/SignUpService.dart';
import '../../Data/Models/UserModels/AuthModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/ProfileModels/SetUpProfileModel.dart';
import '../../Data/Models/UserModels/SignUpModel.dart';

import '../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';

class SignUpController {
  /// SignUp Service instance
  final _signUpService = SignUpService();

  Future<Either<ErrorModel, AuthModel>> signUp(
          {required SignUpModel signUpModel}) async =>
      await _signUpService.signUp(signUpModel);

  Future<Either<ErrorModel, ServiceProviderProfileModel>> setUpProfile(
          {required SetUpProfileModel setUpProfileModel,
          String? token}) async =>
      await _signUpService.serviceProviderSetUpProfile(
          model: setUpProfileModel, token: token!);
}
