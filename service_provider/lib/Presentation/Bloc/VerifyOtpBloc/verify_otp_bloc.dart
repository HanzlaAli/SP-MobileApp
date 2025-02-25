import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/VerificationModel/OtpModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../../Presentation/Controllers/VerifyOtpController.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEventBase, VerifyOtpStateBase> {
  final veriftyOtpController = VeriftyOtpController();

  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyOtpLoading());
      Either<ErrorModel, SuccessModel> response =
          await veriftyOtpController.verifyOtp(otpModel: event.otpModel!);
      response.fold((l) => emit(VerifyOtpError(errorModel: l)), (r) {
        return emit(VerifyOtpSuccess(successModel: r));
      });
    });
  }
}
