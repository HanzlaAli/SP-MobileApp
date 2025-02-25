import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/TransactionModels/TotalCashOfServiceProviderResponseModel.dart';
import '../../../Presentation/Controllers/TransactionController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionController _controller = TransactionController();

  final _sharedPrefrenceController = SharedPrefrenceController();
  TransactionBloc() : super(TransactionInitial()) {
    on<GetServiceProviderCashEvent>((event, emit) async {
      emit(TransactionLoading());
      String? token = await _sharedPrefrenceController
          .getToken();

      if (token != null) {
        Either<ErrorModel, TotalCashOfServiceProviderResponseModel> res =
            await _controller.getTotalCashOfServiceProvider(token);
        res.fold((l) => emit(TransactionError()), (r) {
          emit(TransactionLoaded(model: r));
        });
      }
    });
  }
}
