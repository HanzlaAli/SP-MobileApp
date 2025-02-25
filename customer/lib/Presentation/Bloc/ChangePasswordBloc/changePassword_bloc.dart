import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/ChangePasswordController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
import '../UserModels/ChangePasswordModel.dart';
part 'changePassword_event.dart';
part 'changePassword_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEventBase, ChangePasswordStateBase> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _chanPasswordController = ChangePasswordController();
  ChangePasswordBloc() : super(ChangePasswordInitialState()) {
    on<ChangePasswordEvent>((event, emit) async {
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
          //  if (presentDate.compareTo(date) > 0) {
          Either<ErrorModel, SuccessModel> res =
              await _chanPasswordController.changePassword(
                  changePasswordModel: event.changePasswordModel, token: token);
          res.fold((l) => emit(NotChangePasswordenticatedState()), (r) {
            emit(ChangePasswordSuccessState());
          });
          //   } else {
          //      emit(NotChangePasswordenticatedState());
          //    }
        } else {
          emit(NotChangePasswordenticatedState());
        }
      } catch (e) {
        emit(NotChangePasswordenticatedState());
      }
    });
  }
}
