import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/SpecializationModel/AddServiceProviderSpecializationModel.dart';
import '../../Data/Models/SpecializationModel/GetSpecialization.dart';

import '../Repo/Api/ServiceProviderSpecializationRepo.dart';

class ServiceProviderSpecializationService {
  ServiceProviderSpecializationRepo serviceProviderSpecializationRepo =
      ServiceProviderSpecializationRepo();
  Future<Either<ErrorModel, List<GetSpecializationModel>>> getSpecializations(
      String token) async {
    List<GetSpecializationModel> specializationList = [];
    http.Response response = await serviceProviderSpecializationRepo.get(
        url: serviceProviderSpecializationRepo.getSpecializationType, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var res = jsonDecode(response.body);

      GetSpecializationModel model;
      for (var data in res) {
        model = GetSpecializationModel.fromJson(data);
        specializationList.add(model);
      }
      return right(specializationList);
    } else {
      return left(ErrorModel(
          code: response.statusCode, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> addSpecialization(
      AddServiceProviderSpecializationModel model, String token) async {
    http.Response response = await serviceProviderSpecializationRepo.post(
        url: serviceProviderSpecializationRepo.addServiceProviderSpecialization,
        body: model.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }
}
