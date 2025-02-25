import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../Data/Models/CustomerModels/GetCustomerBookedServices.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/CustomerServiceRepo.dart';

class CustomerServicesService {
  final customerServicesRepo = CustomerServicesRepo();
  Future<Either<ErrorModel, List<GetCustomerBookedServiceModel>>>
      getAllBookedServices(
    String? token,
  ) async {
    Response response = await customerServicesRepo.get(
        url: customerServicesRepo.getCustomerListByServiceProvider, token: token);
    if (response.statusCode == 200) {
      List<GetCustomerBookedServiceModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetCustomerBookedServiceModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }
}
