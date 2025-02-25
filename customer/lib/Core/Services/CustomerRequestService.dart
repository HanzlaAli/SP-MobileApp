import 'dart:convert';
import 'package:customer/Core/Repo/Api/CustomerRequestRepo.dart';
import 'package:customer/Data/Models/CustomerRequestModels/create_or_update_customer_service_request.dart';
import 'package:customer/Data/Models/CustomerRequestModels/delete_customer_request_image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class CustomerRequestService {
  final _customerRequestRepo = CustomerRequestRepo();

  Future<Either<ErrorModel, SuccessModel>> createCustomerServiceRequest(
      CreateOrUpdateCustomerServiceRequestModel model, String token) async {
    http.Response response = await _customerRequestRepo.createCustomerRequest(
        model: model, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Created!"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> updateCustomerServiceRequest(
      CreateOrUpdateCustomerServiceRequestModel model, String token) async {
    http.Response response = await _customerRequestRepo.updateCustomerRequest(
        model: model, token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Created!"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> deletePictureCustomerServiceRequest(
      DeleteCustomerRequestImageModel model, String token) async {
    http.Response response = await _customerRequestRepo.put(
        url: _customerRequestRepo.deletePictureCustomerRequestPath,
        body: model.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Image Deleted!"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> deleteCustomerServiceRequest(
      int id, String token) async {
    http.Response response = await _customerRequestRepo.delete(
        url: '${_customerRequestRepo.deleteCustomerRequestPath}$id',
        token: token,
        body: null);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel(code: 200, message: "Created!"));
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }

  Future<Either<ErrorModel, List<CustomerRequestServiceModel>>>
      getCustomerRequestedServices(String token, String? filter) async {
    http.Response response = await _customerRequestRepo.get(
        url: filter == null
            ? _customerRequestRepo.getCustomerRequestPath
            : '${_customerRequestRepo.getCustomerRequestPath}?filter=$filter',
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
