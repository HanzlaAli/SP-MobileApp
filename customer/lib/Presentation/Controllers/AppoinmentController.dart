import 'package:dartz/dartz.dart';
import '../../Core/Services/AppoinmentService.dart';
import '../../Data/Models/AppoinmentModels/AppointmentHistoryOfCustomerModel.dart';
import '../../Data/Models/AppoinmentModels/CreateAppoinmentModel.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentResponseModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppointmentsRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetCustomerRequestedAppointmentsModel.dart';
import '../../Data/Models/AppoinmentModels/CustomerAppoinmentRequestModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class AppoinmentController {
  final service = AppoinmentService();

  Future<Either<ErrorModel, List<GetCustomerAppoinmentsModel>>>
      getBookedAppoinments(
              String token, GetBookedAppoinmentRequestModel model) async =>
          service.getBookedAppoinments(token, model);
  Future<Either<ErrorModel, List<AppointmentHistoryOfCustomerModel>>>
      getAppointmentHistory(String? token) async =>
          service.getAppoinmentsHistory(token);

  Future<Either<ErrorModel, SuccessModel>> requestForAppoinment(
          CustomerAppoinmentRequestModel model, String token) async =>
      service.requestForAppoinment(model, token);

  Future<Either<ErrorModel, List<GetCustomerRequestedAppoinmentsModel>>>
      getRequestedAppoinmentOfCustomer(String? token) async =>
          service.getRequestedAppoinmentOfCustomer(token);
          
  Future<Either<ErrorModel, List<GetServiceProviderAppointmentsResponseModel>>>
      getRequestedAppoinmentByServiceProviderId(
              GetServiceProviderAppointments model, String? token) async =>
          service.getRequestedAppoinmentByServiceProviderId(model, token);

  Future<Either<ErrorModel, SuccessModel>> createAppoinment(
          CreateAppoinmentModel createAppoinmentModel, String token) async =>
      service.createAppoinment(createAppoinmentModel, token);
}
