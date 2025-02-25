import 'package:dartz/dartz.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/UserModels/ChangePasswordModel.dart';
import '../../Core/Services/ChangePasswordService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class ChangePasswordController {
  final _changePasswordService = ChangePasswordService();
  Future<Either<ErrorModel, SuccessModel>> changePassword(
          {required ChangePasswordModel changePasswordModel,
          required String token}) async =>
      await _changePasswordService.changePassword(changePasswordModel, token);
}
