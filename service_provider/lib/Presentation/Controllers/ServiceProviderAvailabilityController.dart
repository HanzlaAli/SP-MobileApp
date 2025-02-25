import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderAvailabilityService.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/CreateServiceProviderAvailabilityModel.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/GetServiceProviderAvailabilityModel.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/UpdateServiceProviderAvailabilityModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceProviderAvailabilityController {
  final serviceProviderAvailabilityService = ServiceProviderAvailabilityService();
  
  Future<Either<ErrorModel, SuccessModel>> addServiceProviderAvailability(
          CreateServiceProviderAvailabilityModel model, String token) async =>
      serviceProviderAvailabilityService.addServiceProviderAvailability(model, token);

  Future<Either<ErrorModel, SuccessModel>> deleteService(
          int id, String token) async =>
      serviceProviderAvailabilityService.deleteService(id, token);

  Future<Either<ErrorModel, SuccessModel>> updateService(
          UpdateServiceProviderAvailabilityModel model, String token) async =>
      serviceProviderAvailabilityService.updateService(model, token);

  Future<Either<ErrorModel, List<GetServiceProviderAvailabilityModel>>> getServices(
          String token) async =>
      serviceProviderAvailabilityService.getServices(token);
}
