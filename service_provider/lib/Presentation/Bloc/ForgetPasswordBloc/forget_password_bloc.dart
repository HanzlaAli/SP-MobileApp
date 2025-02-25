// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/VerificationModel/AddNewPasswordModel.dart';
import '../../../Data/Models/VerificationModel/ForgetPasswordModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Presentation/Controllers/ForgetPassword.dart';
import 'package:equatable/equatable.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final _forgetPasswordController = ForgetPasswordController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
    on<RequestForChangePassword>((event, emit) async {
      emit(ForgetPasswordLoading());

      Either<ErrorModel, SuccessModel> response =
          await _forgetPasswordController.forgetPassword(
              forgetPasswordModel: event.forgetPasswordModel!);
      response.fold((l) => emit(ForgetPasswordError(errorModel: l)),
          (r) => emit(ForgetPasswordSuccess(successModel: r)));
      //  }
    });
    on<AddNewPassword>((event, emit) async {
      emit(ForgetPasswordLoading());
      //    String? token = await _sharedPrefrenceController.getToken();
      //  if (token != null) {
      Either<ErrorModel, SuccessModel> response =
          await _forgetPasswordController.addNewPassword(
              addNewPasswordModel: event.addNewPasswordModel!);
      response.fold((l) => emit(ForgetPasswordError(errorModel: l)),
          (r) => emit(ForgetPasswordSuccess(successModel: r)));
      //  }
    });
  }
}
