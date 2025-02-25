import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/WithdrawalRepo.dart';
import '../../Data/Models/WithdrawModels/CreateWithdrawAccountRequestModel.dart';
import '../../Data/Models/WithdrawModels/CreateWithdrawAccountResponseModel.dart';
import '../../Data/Models/WithdrawModels/WithdrawHistoryModel.dart';
import '../../Data/Models/WithdrawModels/WithdrawRequestModel.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class WithdrawService {
  WithdrawRepo repo = WithdrawRepo();
  Future<Either<ErrorModel, List<WithdrawHistoryModel>>> getWithdrawHistory(
      String token) async {
    List<WithdrawHistoryModel> withdrawList = [];
    http.Response response =
        await repo.get(url: repo.getWithdrawsHistory, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      WithdrawHistoryModel model;
      var res = jsonDecode(response.body);
      for (var data in res) {
        model = WithdrawHistoryModel.fromJson(data);
        withdrawList.add(model);
      }
      return right(withdrawList);
    } else {
      return left(ErrorModel(
          code: response.statusCode, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> withDrawRequest(
      WithdrawRequestModel model, String token) async {
    http.Response response = await repo.post(
        url: repo.withdrawRequest, body: model.toJson(), token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, CreateWithdrawAccountResponseModel>>
      createWithDrawAccount(
          CreateWithdrawAccountRequestModel model, String token) async {
    http.Response response = await repo.post(
        url: repo.createWithdrawAccount, body: model.toJson(), token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(CreateWithdrawAccountResponseModel.fromJson(
          jsonDecode(response.body)));
    } else {
      return left(ErrorModel());
    }
  }
}

