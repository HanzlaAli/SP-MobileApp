import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/src/response.dart';
import '../../Core/Repo/Api/ServcicesRepo.dart';
import '../../Data/Models/ServicesModels/FilteredServiceRequestModel.dart';
import '../../Data/Models/ServicesModels/GetServiceProviderServiceRequestModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/ServicesModels/GetAllServicesModel.dart';

class ServicesService {
  final _serviceRepo = ServiceRepo();
  Future<Either<ErrorModel, List<GetAllServiceModel>>> getAllServices(
    String? token,
  ) async {
    Response response =
        await _serviceRepo.get(url: _serviceRepo.getAllServices, token: token);
    if (response.statusCode == 200) {
      List<GetAllServiceModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetAllServiceModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<GetAllServiceModel>>> getFilteredServices(
      String? token, FilterServiceRequestModel model) async {
    Response response = await _serviceRepo.post(
        url: _serviceRepo.getFilteredServices,
        token: token,
        body: model.toJson());
    if (response.statusCode == 200) {
      List<GetAllServiceModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetAllServiceModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<GetAllServiceModel>>> getServicesByServiceProvider(
    GetServiceProviderServicesReuqestModel model,
    String? token,
  ) async {
    Response response = await _serviceRepo.post(
        url: _serviceRepo.getServicesByServiceProvider,
        token: token,
        body: model.toJson());
    if (response.statusCode == 200) {
      List<GetAllServiceModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetAllServiceModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }
}
