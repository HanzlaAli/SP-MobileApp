import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderTherapyService.dart';
import '../../Data/Models/TherapyModels/AddTherapy.dart';
import '../../Data/Models/TherapyModels/GetServiceProviderTherapyModel.dart';
import '../../Data/Models/TherapyModels/GetTherapyTypeModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceProviderTherapyController {
  ServiceProviderTherapyService serviceProviderTherapyService = ServiceProviderTherapyService();
  Future<Either<ErrorModel, List<GetTherapyTypeModel>>> getTherapy(
          {required String token}) async =>
      await serviceProviderTherapyService.getTherapyType(token);

  Future<Either<ErrorModel, List<GetServiceProviderTherapyModel>>> getServiceProviderTherapy(
          {required String token}) async =>
      await serviceProviderTherapyService.getServiceProviderTherapyType(token);

  Future<Either<ErrorModel, SuccessModel>> addServiceProviderTherapy(
          {required AddServiceProviderTherapyModel model,
          required String token}) async =>
      await serviceProviderTherapyService.addTherapyTypes(model, token);
}
