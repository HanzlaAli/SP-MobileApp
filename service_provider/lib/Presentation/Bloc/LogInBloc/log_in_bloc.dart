// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/UserModels/AuthModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/UserModels/LogInModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Presentation/Controllers/LogInController.dart';
import 'package:equatable/equatable.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final _logInController = LogInController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  LogInBloc() : super(LogInInitial()) {
    on<ServiceProviderAuth>((event, emit) async {
      emit(LogInLoading());
      try {
        Either<ErrorModel, AuthModel> response =
            await _logInController.login(logInModel: event.logInModel!);
        response.fold((l) => emit(LogInError(errorModel: l)), (r) {
          if (r.token != null) {
            _sharedPrefrenceController.tokenSave(r.token!);
            _sharedPrefrenceController.refreshTokenSave(r.refreshToken!);
            _sharedPrefrenceController.tokenExpirationSave(r.expiration!);
          }
          return emit(LogInSuccess(
              successModel: SuccessModel(message: 'Loggedin Succed!')));
        });
      } catch (e) {
        emit(LogInError());
      }
    });
  }
}
