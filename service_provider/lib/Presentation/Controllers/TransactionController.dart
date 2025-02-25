import 'package:dartz/dartz.dart';
import '../../Core/Services/TransactionService.dart';

import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/TransactionModels/TotalCashOfServiceProviderResponseModel.dart';

class TransactionController {
  TransactionService service = TransactionService();
  Future<Either<ErrorModel, TotalCashOfServiceProviderResponseModel>>
      getTotalCashOfServiceProvider(String token) async =>
          service.getTotalCashOfServiceProvider(token);
}
