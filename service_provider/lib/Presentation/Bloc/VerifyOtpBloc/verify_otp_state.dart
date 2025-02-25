part of 'verify_otp_bloc.dart';

abstract class VerifyOtpStateBase {
  const VerifyOtpStateBase();
}

class VerifyOtpInitial extends VerifyOtpStateBase {}

class VerifyOtpLoading extends VerifyOtpStateBase {}

class VerifyOtpSuccess extends VerifyOtpStateBase {
  SuccessModel? successModel;
  VerifyOtpSuccess({this.successModel});
}

class VerifyOtpError extends VerifyOtpStateBase {
  ErrorModel? errorModel;
  VerifyOtpError({this.errorModel});
}
