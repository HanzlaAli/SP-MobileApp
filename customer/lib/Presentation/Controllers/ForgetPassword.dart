// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import '../../../Core/Services/ForgetPasswordService.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/VerificationModels/AddNewPasswordModel.dart';
import '../../Data/Models/VerificationModels/ForgetPasswordModel.dart';

class ForgetPasswordController {
  final _forgetPasswordServices = ForgetpasswordService();

  Future<Either<ErrorModel, SuccessModel>> forgetPassword({
    required ForgetPasswordModel forgetPasswordModel,
  }) async =>
      await _forgetPasswordServices.forgetPassword(forgetPasswordModel);

  Future<Either<ErrorModel, SuccessModel>> addNewPassword({
    required AddNewPasswordModel addNewPasswordModel,
  }) async =>
      await _forgetPasswordServices.addNewPassword(addNewPasswordModel);
}
