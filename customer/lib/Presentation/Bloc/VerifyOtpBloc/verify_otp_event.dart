part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEventBase {
  const VerifyOtpEventBase();
}

class VerifyOtpEvent extends VerifyOtpEventBase {
  OtpModel? otpModel;
  VerifyOtpEvent({this.otpModel});
}
