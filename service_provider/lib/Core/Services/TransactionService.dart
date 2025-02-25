import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/TransactionRepo.dart';
import '../../Data/Models/TransactionModels/TotalCashOfServiceProviderResponseModel.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';

class TransactionService {
  TransactionRepo repo = TransactionRepo();
  Future<Either<ErrorModel, TotalCashOfServiceProviderResponseModel>>
      getTotalCashOfServiceProvider(String token) async {
    http.Response response = await repo.get(
      url: repo.getTotalCashOfServiceProvider,
      token: token,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);

      return right(TotalCashOfServiceProviderResponseModel.fromJson(res));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
