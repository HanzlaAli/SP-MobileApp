import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/CreateServiceProviderAvailabilityModel.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/GetServiceProviderAvailabilityModel.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/UpdateServiceProviderAvailabilityModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/ServiceProviderAvailabilityRepo.dart';

class ServiceProviderAvailabilityService {
  final serviceProviderAvailabilityRepo = ServiceProviderAvailibilityRepo();
  Future<Either<ErrorModel, SuccessModel>> addServiceProviderAvailability(
      CreateServiceProviderAvailabilityModel model, String token) async {
    http.Response response = await serviceProviderAvailabilityRepo.post(
        url: serviceProviderAvailabilityRepo.addServiceProviderAvailability,
        body: model.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> deleteService(
      int id, String token) async {
    http.Response response = await serviceProviderAvailabilityRepo.post(
        url: serviceProviderAvailabilityRepo.deleteServiceProviderAvailability,
        body: {"id": id},
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateService(
      UpdateServiceProviderAvailabilityModel model, String token) async {
    http.Response response = await serviceProviderAvailabilityRepo.put(
        url: serviceProviderAvailabilityRepo.updateServiceProviderAvailability,
        body: model.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, List<GetServiceProviderAvailabilityModel>>> getServices(
      String token) async {
    http.Response response = await serviceProviderAvailabilityRepo.get(
      url: serviceProviderAvailabilityRepo.getServiceProviderAvailability,
      token: token,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<GetServiceProviderAvailabilityModel> list = [];
      var res = jsonDecode(response.body);
      for (var data in res) {
        list.add(GetServiceProviderAvailabilityModel.fromJson(data));
      }
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
