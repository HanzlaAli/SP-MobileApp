// ignore_for_file: file_names
import 'dart:convert';
import 'dart:io';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import 'package:dartz/dartz.dart';
import '../../Data/Models/ServiceProvider/GetServiceProviderDetailsModel.dart';
import '../Repo/Api/ServiceProviderProfileRepo.dart';

class ServiceProviderProfileServices {
  final _serviceProviderProfileRepo = ServiceProviderProfileRepo();

  Future<Either<ErrorModel, ServiceProviderProfileModel>> getServiceProviderProfile(
      String token) async {
    http.Response response = await _serviceProviderProfileRepo.get(
        url: _serviceProviderProfileRepo.getServiceProviderProfile, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);

      return right(ServiceProviderProfileModel.fromJson(res));
    } else if (response.statusCode == 405) {
      return left(ErrorModel(
          code: response.statusCode, message: 'Please Fill all your Info'));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateServiceProviderProfile(
      String token, File img) async {
    http.StreamedResponse response =
        await _serviceProviderProfileRepo.updateProfile(img: img, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else if (response.statusCode == 405) {
      return left(ErrorModel(
          code: response.statusCode, message: 'Please Fill all your Info'));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, GetServiceProviderDetailsModel>> getServiceProviderDetails(
      String token) async {
    http.Response response = await _serviceProviderProfileRepo.get(
        url: _serviceProviderProfileRepo.getServiceProviderDetails, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);

      return right(GetServiceProviderDetailsModel.fromJson(res));
    } else if (response.statusCode == 405) {
      return left(ErrorModel(
          code: response.statusCode, message: 'Please Fill all your Info'));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
