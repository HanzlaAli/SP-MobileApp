import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Data/Models/WithdrawModels/CreateWithdrawAccountRequestModel.dart';
import '../../../Data/Models/WithdrawModels/CreateWithdrawAccountResponseModel.dart';
import '../../../Data/Models/WithdrawModels/WithdrawHistoryModel.dart';
import '../../../Data/Models/WithdrawModels/WithdrawRequestModel.dart';
import '../../../Presentation/Controllers/WithDrawController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'withdraw_event.dart';
part 'withdraw_state.dart';

class WithdrawBloc extends Bloc<WithdrawEvent, WithdrawState> {
  WithdrawBloc() : super(WithdrawInitial()) {
    WithdrawController controller = WithdrawController();
    final sharedPrefrenceController = SharedPrefrenceController();
    on<GetWithdraws>((event, emit) async {
      emit(WithdrawLoading());
      String? token = await sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, List<WithdrawHistoryModel>> response =
            await controller.getWithdrawHistory(token);
        response.fold((l) => emit(WithdrawError()), (r) {
          return emit(WithdrawLoaded(model: r));
        });
      }
    });
    on<SendWithdrawRequest>((event, emit) async {
      emit(WithdrawLoading());
      String? token = await sharedPrefrenceController.getToken();
      int? accountid;
      if (token != null) {
        Either<ErrorModel, CreateWithdrawAccountResponseModel> res =
            await controller.createWithDrawAccount(
                event.createWithdrawAccountRequestModel!, token);
        res.fold((l) => WithdrawError(), (r) => accountid = r.id);
        if (res.isRight()) {
          event.model?.createWithdrawalRequestModel?.approvedById = 0;
          event.model?.createWithdrawalRequestModel?.createOn =
              DateTime.now().toIso8601String();
          event.model?.createWithdrawalRequestModel?.withdrawalAccountId =
              accountid;
          event.model?.createWithdrawalRequestModel?.withdrawalStatusId = 1;
          Either<ErrorModel, SuccessModel> response =
              await controller.withDrawRequest(event.model!, token);
          response.fold((l) => emit(WithdrawError()), (r) {
            return emit(WithdrawSuccess());
          });
        } else {
          emit(WithdrawError());
        }
      }
    });
  }
}
