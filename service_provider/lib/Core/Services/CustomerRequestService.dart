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
    String url = _customerRequestRepo.getAllCustomerRequestPath;
    
    if (filter != null && filter.isNotEmpty) {
      url += '?filter=$filter';
      if (serviceTypeId != null) {
        url += '&serviceTypeId=$serviceTypeId';
      } 
    } else if (serviceTypeId != null) {
      url += '?serviceTypeId=$serviceTypeId';
    }

    http.Response response =
        await _customerRequestRepo.get(url: url, token: token);

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
