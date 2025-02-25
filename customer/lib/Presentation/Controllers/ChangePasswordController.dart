import 'package:dartz/dartz.dart';
import '../../Core/Services/ChangePasswordService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Bloc/UserModels/ChangePasswordModel.dart';

class ChangePasswordController {
  final _changePasswordService = ChangePasswordService();
  Future<Either<ErrorModel, SuccessModel>> changePassword(
          {required ChangePasswordModel changePasswordModel,
          required String token}) async =>
      await _changePasswordService.changePassword(changePasswordModel, token);
}
