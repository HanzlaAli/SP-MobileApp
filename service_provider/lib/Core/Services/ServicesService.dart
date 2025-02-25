import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../Data/Models/ServiceProvider/GetServiceProviderServiceRequestModel.dart';
import '../../Data/Models/ServicesModels/AddServiceModel.dart';
import '../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../Data/Models/ServicesModels/UpdateServiceModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/ServicesModels/DeleteServicesModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/ServiceRepo.dart';

class ServicesService {
  final serviceRepo = ServiceRepo();
  Future<Either<ErrorModel, SuccessModel>> addService(
      AddServicesModel addServicesModel, String token) async {
    http.Response response = await serviceRepo.post(
        url: serviceRepo.addService,
        body: addServicesModel.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> deleteService(
      DeleteServiceModel deleteServiceModel, String token) async {
    http.Response response = await serviceRepo.post(
        url: serviceRepo.deleteServices,
        body: deleteServiceModel.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateService(
      UpdateServiceModel updateServiceModel, String token) async {
    http.Response response = await serviceRepo.put(
        url: serviceRepo.updateServices,
        body: updateServiceModel.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, List<GetServicesModel>>> getServices(
      String token, GetServiceProviderServicesReuqestModel model) async {
    http.Response response = await serviceRepo.post(
        url: serviceRepo.getServices, token: token, body: model.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<GetServicesModel> list = [];
      var res = jsonDecode(response.body);
      for (var data in res) {
        list.add(GetServicesModel.fromJson(data));
      }
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
