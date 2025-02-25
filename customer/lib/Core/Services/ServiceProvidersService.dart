import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/ServiceProviderRepo.dart';

import '../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import 'package:http/http.dart' as http;

class ServiceProvidersService {
  final serviceProviderRepo = ServiceProviderRepo();

  Future<Either<ErrorModel, List<GetServiceProvidersModel>>> getServiceProviders(
      String token) async {
    http.Response response =
        await serviceProviderRepo.get(url: serviceProviderRepo.getServiceProviders, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<GetServiceProvidersModel> list = [];
      var res = jsonDecode(response.body);
      for (var data in res) {
        list.add(GetServiceProvidersModel.fromJson(data));
      }
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
