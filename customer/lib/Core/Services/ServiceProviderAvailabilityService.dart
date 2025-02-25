import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/ServiceProviderAvailabilityModel/ServiceProviderAvailabilityModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/ServiceProviderAvailabilityRepo.dart';


class ServiceProviderAvailabilityService {
  final serviceProviderAvailabilityRepo = ServiceProviderAvailabilityRepo();

  Future<Either<ErrorModel, List<ServiceProviderAvailabilityModel>>>
      getServiceProviderAvailabilotyByServiceProviderId(
          int id, int weekDays, String token) async {
    http.Response response = await serviceProviderAvailabilityRepo.get(
      url:
          "${serviceProviderAvailabilityRepo.getServiceProviderAvailability}?Id=$id&DayOfWeek=$weekDays",
      token: token,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<ServiceProviderAvailabilityModel> list = [];
      var res = jsonDecode(response.body);
      for (var data in res) {
        list.add(ServiceProviderAvailabilityModel.fromJson(data));
      }
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
    
  }
}
