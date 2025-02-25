import 'package:dartz/dartz.dart';
import '../../Core/Services/WithdrawService.dart';
import '../../Data/Models/WithdrawModels/CreateWithdrawAccountRequestModel.dart';
import '../../Data/Models/WithdrawModels/WithdrawRequestModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/WithdrawModels/CreateWithdrawAccountResponseModel.dart';
import '../../Data/Models/WithdrawModels/WithdrawHistoryModel.dart';

class WithdrawController {
  WithdrawService service = WithdrawService();
  Future<Either<ErrorModel, List<WithdrawHistoryModel>>> getWithdrawHistory(
          String token) async =>
      service.getWithdrawHistory(token);
  Future<Either<ErrorModel, SuccessModel>> withDrawRequest(
          WithdrawRequestModel model, String token) async =>
      service.withDrawRequest(model, token);
  Future<Either<ErrorModel, CreateWithdrawAccountResponseModel>>
      createWithDrawAccount(CreateWithdrawAccountRequestModel model, String token) async =>
          service.createWithDrawAccount(model, token);
}
