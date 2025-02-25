// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/UserModels/AuthModel.dart';
import '../../Core/Repo/Api/SignUpRepo.dart';
import '../../Data/Models/UserModels/SignUpModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class SignUpService {
  final _signUpRepo = SignUpRepo();
  Future<Either<ErrorModel, AuthModel>> signUp(SignUpModel signUp) async {
    http.Response response = await _signUpRepo.post(
        url: _signUpRepo.signUpCustomer, body: signUp.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(AuthModel.fromJson(json.decode(response.body)));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
