import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/UserModels/AuthModel.dart';
import '../../../Data/Models/UserModels/RefreshTokenRequestModel.dart';
import '../../Controllers/LogInController.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEventBase, AuthStateBase> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _loginController = LogInController();
  AuthBloc() : super(AuthInitialState()) {
    on<isLoggedIn>((event, emit) async {
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
          if (presentDate.compareTo(date) > 0) {
            Either<ErrorModel, AuthModel> res =
                await _loginController.refreshToken(RefreshTokenModel(
                    refreshToken: refreshToken, token: token));
            res.fold((l) => emit(NotAuthenticatedState()), (r) {
              _sharedPrefrenceController.tokenSave(r.token!);
              _sharedPrefrenceController.refreshTokenSave(r.refreshToken!);
              _sharedPrefrenceController.tokenExpirationSave(r.expiration!);
              emit(AuthenticatedState());
            });
          } else {
            emit(AuthenticatedState());
          }
        } else {
          emit(NotAuthenticatedState());
        }
      } catch (e) {
        emit(NotAuthenticatedState());
      }
    });
  }
}
