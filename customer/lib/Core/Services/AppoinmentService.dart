import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../Data/Models/AppoinmentModels/GetCustomerRequestedAppointmentsModel.dart';
import '../../Data/Models/AppoinmentModels/CustomerAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/AppointmentHistoryOfCustomerModel.dart';
import '../../Data/Models/AppoinmentModels/CreateAppoinmentModel.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentResponseModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentsRequestModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/AppoinmentRepo.dart';

class AppoinmentService {
  final appoinmentRepo = AppoinmentRepo();

  Future<Either<ErrorModel, List<GetCustomerAppoinmentsModel>>>
      getBookedAppoinments(
          String? token, GetBookedAppoinmentRequestModel model) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getCustomerBookedAppoinments,
        token: token,
        body: model.toJson());
    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<GetCustomerAppoinmentsModel> list = [];
      for (var items in res) {
        list.add(GetCustomerAppoinmentsModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }

  Future<Either<ErrorModel, List<AppointmentHistoryOfCustomerModel>>>
      getAppoinmentsHistory(String? token) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getCustomerAppoinmentHistory,
        token: token,
        body: {"email": ""});
    if (response.statusCode == HttpStatus.ok) {
      List<AppointmentHistoryOfCustomerModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(AppointmentHistoryOfCustomerModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, List<GetCustomerRequestedAppoinmentsModel>>>
      getRequestedAppoinmentOfCustomer(String? token) async {
    Response response = await appoinmentRepo.post(
      url: appoinmentRepo.getRequestedAppoinmentsByCustomer,
      token: token,
    );
    if (response.statusCode == 200) {
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

  Future<Either<ErrorModel, List<GetServiceProviderAppointmentsResponseModel>>>
      getRequestedAppoinmentByServiceProviderId(
          GetServiceProviderAppointments model, String? token) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getAppointmentByServiceProviderId,
        token: token,
        body: model.toJson());
    if (response.statusCode == 200) {
      List<GetServiceProviderAppointmentsResponseModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(GetServiceProviderAppointmentsResponseModel.fromJson(items));
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
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel());
    }
  }

  Future<Either<ErrorModel, SuccessModel>> requestForAppoinment(
      CustomerAppoinmentRequestModel model, String token) async {
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.requestForAppoinment,
        body: model.toJson(),
        token: token);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(code: 400, message: "Something Went Wrong"));
    }
  }
}
