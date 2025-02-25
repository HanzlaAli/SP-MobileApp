import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/DeleteAccountRepo.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class DeleteAccountService {
  final _deleteAccountRepo = DeleteAccountRepo();

  Future<Either<ErrorModel, SuccessModel>> deleteAccount(String token) async {
    http.Response response = await _deleteAccountRepo.post(
        url: _deleteAccountRepo.deleteAccount,
        token: token,
        body: {"email": ""});
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Password Changed"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
