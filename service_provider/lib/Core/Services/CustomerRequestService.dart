import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/CustomerRequestRepo.dart';

class CustomerRequestService {
  final _customerRequestRepo = CustomerRequestRepo();

  Future<Either<ErrorModel, List<CustomerRequestServiceModel>>>
      getCustomerRequestedServices(
          String token, String? filter, int? serviceTypeId) async {
    http.Response response = await _customerRequestRepo.get(
        url: filter == null
            ? _customerRequestRepo.getAllCustomerRequestPath
            : '${_customerRequestRepo.getAllCustomerRequestPath}?filter=$filter&serviceTypeId=$serviceTypeId',
        token: token);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List res = jsonDecode(response.body);
      var list = res
          .map((e) => CustomerRequestServiceModel.fromJson(e))
          .toList()
          .cast<CustomerRequestServiceModel>();
      return right(list);
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
