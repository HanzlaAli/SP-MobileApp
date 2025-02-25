import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/LicenseModels/AddServiceProviderLicense.dart';
import '../../Data/Models/LicenseModels/GetLicenseTypeModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/ServiceProviderLicenseRepo.dart';

class ServiceProviderLicenseService {
  ServiceProviderLicenseRepo serviceProviderLicenseRepo = ServiceProviderLicenseRepo();
  Future<Either<ErrorModel, List<GetLicenseTypeModel>>> getLicenseType(
      String token) async {
    List<GetLicenseTypeModel> specializationList = [];
    http.Response response = await serviceProviderLicenseRepo.get(
        url: serviceProviderLicenseRepo.getLicenseType, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      GetLicenseTypeModel model;
      var res = jsonDecode(response.body);
      for (var data in res) {
        model = GetLicenseTypeModel.fromJson(data);
        specializationList.add(model);
      }
      return right(specializationList);
    } else {
      return left(ErrorModel(
          code: response.statusCode, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> addServiceProviderLicense(
      AddServiceProviderLicenseModel model, String token) async {
    http.StreamedResponse response =
        await serviceProviderLicenseRepo.serviceProviderLicense(model: model, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateServiceProviderLicense(
      int id, AddServiceProviderLicenseModel model, String token) async {
    http.StreamedResponse response = await serviceProviderLicenseRepo
        .updateServiceProviderLicense(id: id, model: model, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }
}
