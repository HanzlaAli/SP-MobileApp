// ignore_for_file: file_names, depend_on_referenced_packages
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/Repo/Api/SetUpProfileRepo.dart';
import '../../Data/Models/CustomerModel/CustomerProfileModel.dart';
import '../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/CustomerModel/GetCustomerDetails.dart';
import '../../Data/Models/CustomerModel/UpdateProfileModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import 'package:dartz/dartz.dart';

class SetUpProfileServices {
  final _setUpProfileRepo = SetUpProfileRepo();

  Future<Either<ErrorModel, CustomerProfileModel>> getCustomerProfile(
      String token) async {
    http.Response response = await _setUpProfileRepo.get(
        url: _setUpProfileRepo.getCustomerProfile, token: token);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      return right(CustomerProfileModel.fromJson(res));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, GetCustomerDetailsModel>> getCustomerDetails(
      String token) async {
    http.Response response = await _setUpProfileRepo.get(
        url: _setUpProfileRepo.getCustomerDetails, token: token);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = json.decode(response.body);
      return right(GetCustomerDetailsModel.fromJson(res));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateProfile(
      String? token, UpdateProfileModel model) async {
    http.Response response = await _setUpProfileRepo.post(
        url: _setUpProfileRepo.updateProfile,
        token: token,
        body: model.toJson());
    if (response.statusCode == 200) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, CustomerProfileModel>> setCustomerProfile(
      SetUpCustomerProfileModel model, String token) async {
    http.Response response =
        await _setUpProfileRepo.serviceProviderLicense(model: model, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(CustomerProfileModel.fromJson(json.decode(response.body)));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
