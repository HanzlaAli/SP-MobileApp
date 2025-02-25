import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Data/Models/AppoinmentModels/CreateAppoinmentModel.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentTypeModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart';
import '../../Data/Models/AppoinmentModels/AppointmentHistoryOfServiceProviderModel.dart';
import '../../Data/Models/AppoinmentModels/GetCustomerRequestedAppointmentsModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/AppoinmentRepo.dart';

class AppoinmentService {
  AppoinmentRepo appoinmentRepo = AppoinmentRepo();
  Future<Either<ErrorModel, List<GetAppoinmentTypeModel>>> getAppoinmentType(
    String? token,
  ) async {
    Response response = await appoinmentRepo.get(
        url: appoinmentRepo.getAppoinmentType, token: token);
    if (response.statusCode == HttpStatus.ok) {
      List<GetAppoinmentTypeModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetAppoinmentTypeModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<GetCustomerRequestedAppoinmentsModel>>>
      getRequestedAppoinmentOfCustomer(String? token) async {
    Response response = await appoinmentRepo.post(
      url: appoinmentRepo.getServiceProviderRequestedAppoinments,
      token: token,
    );
    if (response.statusCode == HttpStatus.ok) {
      List<GetCustomerRequestedAppoinmentsModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetCustomerRequestedAppoinmentsModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<GetServiceProviderAppoinmentsModel>>>
      getBookedAppoinments(
          String? token, GetBookedAppoinmentRequestModel model) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getServiceProviderBookedAppoinments,
        token: token,
        body: model.toJson());
    if (response.statusCode == HttpStatus.ok) {
      List<GetServiceProviderAppoinmentsModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetServiceProviderAppoinmentsModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<AppointmentHistoryOfServiceProviderModel>>>
      getAppoinmentsHistory(String? token) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getServiceProviderAppoinmentHistory,
        token: token,
        body: {"email": ""});
    if (response.statusCode == HttpStatus.ok) {
      List<AppointmentHistoryOfServiceProviderModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(AppointmentHistoryOfServiceProviderModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, SuccessModel>> createAppoinment(
      CreateAppoinmentModel model, String token) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.createAppoinment,
        body: model.toJson(),
        token: token);
    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }
}
