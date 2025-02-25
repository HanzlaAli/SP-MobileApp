import 'package:dartz/dartz.dart';
import '../../Core/Services/DeleteAccountService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class DeleteAccountController {
  final _deleteAccountService = DeleteAccountService();

  Future<Either<ErrorModel, SuccessModel>> deleteAccount(String token) async =>
      await _deleteAccountService.deleteAccount(token);
}
