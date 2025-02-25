import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/DeleteAccountController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'DeleteAccount_event.dart';
part 'DeleteAccount_state.dart';

class DeleteAccountBloc
    extends Bloc<DeleteAccountEventBase, DeleteAccountStateBase> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _deleteAccountController = DeleteAccountController();
  DeleteAccountBloc() : super(DeleteAccountInitialState()) {
    on<DeleteAccountEvent>((event, emit) async {
      String? token;
      String? refreshToken;
      DateTime? date;
      DateTime presentDate = DateTime.now();
      try {
        String? tokenExpDate =
            await _sharedPrefrenceController.getTokenExpiration();
        token = await _sharedPrefrenceController.getToken();
        refreshToken = await _sharedPrefrenceController.getRefreshToken();

        if (tokenExpDate != null && token != null && refreshToken != null) {
          date = DateTime.parse(tokenExpDate);
          Either<ErrorModel, SuccessModel> res =
              await _deleteAccountController.deleteAccount(token);
          res.fold((l) => emit(NotDeleteAccountenticatedState()), (r) {
            _sharedPrefrenceController.deleteAllData();
            emit(DeleteAccountSuccessState());
          });
        } else {
          emit(NotDeleteAccountenticatedState());
        }
      } catch (e) {
        emit(NotDeleteAccountenticatedState());
      }
    });
  }
}
