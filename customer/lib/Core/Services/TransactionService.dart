import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/TransactionModels/GetTranscationHistoryModel.dart';
import '../Repo/Api/TransactionRepo.dart';

class TransactionService {
  TransactionRepo repo = TransactionRepo();
  Future<Either<ErrorModel, List<GetTransactionHistoryModel>>>
      getTransactionHistory(String token) async {
    http.Response response = await repo.get(
      url: repo.getTotalCashOfServiceProvider,
      token: token,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<GetTransactionHistoryModel> list = [];
      var res = jsonDecode(response.body);
      for (var data in res) {
        list.add(GetTransactionHistoryModel.fromJson(data));
      }
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
