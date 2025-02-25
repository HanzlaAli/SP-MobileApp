// ignore_for_file: file_names
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/VerificationModel/OtpModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/VerifyOTpRepo.dart';

class VerifyOtpService {
  final _forgetPasswordRepo = VerifyOtpRepo();
  Future<Either<ErrorModel, SuccessModel>> verifyOtp(OtpModel otpModel) async {
    http.Response res = await _forgetPasswordRepo.post(
      url: _forgetPasswordRepo.verifyOtpUrl,
      body: otpModel.toJson(),
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Otp verified"));
    } else {
      return left(ErrorModel(code: 200, message: "Invalid Otp"));
    }
  }
}
