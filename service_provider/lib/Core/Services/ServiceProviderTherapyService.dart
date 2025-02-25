import 'dart:convert';

import 'package:dartz/dartz.dart';
import '../../Data/Models/TherapyModels/GetServiceProviderTherapyModel.dart';

import 'package:http/http.dart' as http;
import '../../Data/Models/TherapyModels/AddTherapy.dart';
import '../../Data/Models/TherapyModels/GetTherapyTypeModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/ServiceProviderTherapyRepo.dart';

class ServiceProviderTherapyService {
  DotorTherapyRepo serviceProviderTherapyRepo = DotorTherapyRepo();
  Future<Either<ErrorModel, List<GetTherapyTypeModel>>> getTherapyType(
      String token) async {
    List<GetTherapyTypeModel> specializationList = [];
    http.Response response = await serviceProviderTherapyRepo.get(
        url: serviceProviderTherapyRepo.getTherapyType, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);

      GetTherapyTypeModel model;
      for (var data in res) {
        model = GetTherapyTypeModel.fromJson(data);
        specializationList.add(model);
      }
      return right(specializationList);
    } else {
      return left(ErrorModel(
          code: response.statusCode, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, List<GetServiceProviderTherapyModel>>> getServiceProviderTherapyType(
      String token) async {
    List<GetServiceProviderTherapyModel> serviceProviderTherapies = [];
    http.Response response = await serviceProviderTherapyRepo.get(
        url: serviceProviderTherapyRepo.getServiceProviderTherapyType, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);

      GetServiceProviderTherapyModel therapy;
      for (var data in res) {
        therapy = GetServiceProviderTherapyModel.fromJson(data);
        serviceProviderTherapies.add(therapy);
      }
      return right(serviceProviderTherapies);
    } else {
      return left(ErrorModel(
          code: response.statusCode, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> addTherapyTypes(
      AddServiceProviderTherapyModel model, String token) async {
    http.Response response = await serviceProviderTherapyRepo.post(
        url: serviceProviderTherapyRepo.addServiceProviderTherapy,
        body: model.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }
}
