import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/TransactionModels/GetTranscationHistoryModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
import '../../Controllers/TransactionController.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionController _controller = TransactionController();

  final _sharedPrefrenceController = SharedPrefrenceController();
  TransactionBloc() : super(TransactionInitial()) {
    on<GetTransactionEvent>((event, emit) async {
      emit(TransactionLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, List<GetTransactionHistoryModel>> res =
            await _controller.getTransactionHistory(token);
        res.fold((l) => emit(TransactionError()), (r) {
          emit(TransactionLoaded(model: r));
        });
      }
    });
  }
}
