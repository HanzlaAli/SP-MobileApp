// ignore_for_file: file_names
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/UserModels/AuthModel.dart';
import '../../Data/Models/ProfileModels/SetUpProfileModel.dart';
import '../../Data/Models/UserModels/SignUpModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/SignUpRepo.dart';

class SignUpService {
  final _signUpRepo = SignUpRepo();
  Future<Either<ErrorModel, AuthModel>> signUp(SignUpModel signUp) async {
    http.Response response = await _signUpRepo.post(
        url: _signUpRepo.serviceProviderCreate, body: signUp.toJson());
    var res = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(AuthModel.fromJson(res));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, ServiceProviderProfileModel>> serviceProviderSetUpProfile(
      {required SetUpProfileModel model, required String token}) async {
    http.Response res =
        await _signUpRepo.setServiceProviderProfile(model: model, token: token);
    if (res.statusCode == 200 || res.statusCode == 201) {
      var respo = json.decode(res.body);
      return right(ServiceProviderProfileModel.fromJson(respo));
    } else {
      return left(ErrorModel(message: 'Something went wrong', code: 400));
    }
  }
  
}

