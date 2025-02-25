// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import '../../Core/Services/VerifyOtpService.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/VerificationModels/OtpModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class VeriftyOtpController {
  final verifyOtpService = VerifyOtpService();
  Future<Either<ErrorModel, SuccessModel>> verifyOtp(
      {required OtpModel otpModel}) async {
    Either<ErrorModel, SuccessModel> res =
        await verifyOtpService.verifyOtp(otpModel);
    return res;
  }
}
