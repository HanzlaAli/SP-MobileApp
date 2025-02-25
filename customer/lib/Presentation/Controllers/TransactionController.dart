import 'package:dartz/dartz.dart';
import '../../Core/Services/TransactionService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/TransactionModels/GetTranscationHistoryModel.dart';

class TransactionController {
  TransactionService service = TransactionService();
  Future<Either<ErrorModel, List<GetTransactionHistoryModel>>>
      getTransactionHistory(String token) async =>
          service.getTransactionHistory(token);
}
