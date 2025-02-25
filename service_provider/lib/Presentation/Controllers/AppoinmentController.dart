import 'package:dartz/dartz.dart';
import '../../Core/Services/AppoinmentService.dart';
import '../../Data/Models/AppoinmentModels/CreateAppoinmentModel.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentTypeModel.dart';
import '../../Data/Models/AppoinmentModels/AppointmentHistoryOfServiceProviderModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../Data/Models/AppoinmentModels/GetCustomerRequestedAppointmentsModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class AppoinmentController {
  final service = AppoinmentService();
  Future<Either<ErrorModel, List<GetCustomerRequestedAppoinmentsModel>>>
      getRequestedAppoinmentOfCustomer(String? token) async =>
          service.getRequestedAppoinmentOfCustomer(token);

  Future<Either<ErrorModel, List<AppointmentHistoryOfServiceProviderModel>>>
      getAppointmentHistory(String? token) async =>
          service.getAppoinmentsHistory(token);

  Future<Either<ErrorModel, SuccessModel>> createAppoinment(
          CreateAppoinmentModel createAppoinmentModel, String token) async =>
      service.createAppoinment(createAppoinmentModel, token);

  Future<Either<ErrorModel, List<GetAppoinmentTypeModel>>> getAppoinmentType(
          String token) async =>
      service.getAppoinmentType(token);
 
  Future<Either<ErrorModel, List<GetServiceProviderAppoinmentsModel>>>
      getBookedAppoinments(
              String token, GetBookedAppoinmentRequestModel model) async =>
          service.getBookedAppoinments(token, model);
}
