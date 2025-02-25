import 'package:dartz/dartz.dart';
import '../../Core/Services/VerifyOtpService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/VerificationModel/OtpModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class VeriftyOtpController {
  final verifyOtpService = VerifyOtpService();
  Future<Either<ErrorModel, SuccessModel>> verifyOtp(
          {required OtpModel otpModel}) async =>
      await verifyOtpService.verifyOtp(otpModel);
}
