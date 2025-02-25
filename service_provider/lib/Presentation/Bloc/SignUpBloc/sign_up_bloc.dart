// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/UserModels/AuthModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
import '../../../Presentation/Controllers/SignUpController.dart';
import 'package:equatable/equatable.dart';
import '../../../Data/Models/UserModels/SignUpModel.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _signUpController = SignUpController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  SignUpBloc() : super(SignUpInitial()) {
    on<NewServiceProviderAccount>((event, emit) async {
      Either<ErrorModel, AuthModel> response =
          await _signUpController.signUp(signUpModel: event.signUpModel!);
      response.fold((l) => emit(SignUpError(errorModel: l)), (r) {
        if (r.token != null) {
          _sharedPrefrenceController.tokenSave(r.token!);

          _sharedPrefrenceController.tokenExpirationSave(r.expiration!);
        }
        return emit(SignUpSuccess(
            successModel: SuccessModel(message: 'New User Added!')));
      });
    });
  }
}
