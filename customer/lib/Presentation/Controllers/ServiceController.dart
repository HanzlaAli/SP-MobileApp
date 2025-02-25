import 'package:dartz/dartz.dart';
import '../../Core/Services/ServicesService.dart';
import '../../Data/Models/ServicesModels/FilteredServiceRequestModel.dart';
import '../../Data/Models/ServicesModels/GetServiceProviderServiceRequestModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/ServicesModels/GetAllServicesModel.dart';

class ServiceController {
  final _service = ServicesService();
  Future<Either<ErrorModel, List<GetAllServiceModel>>> getAllServices(
          String token) async =>
      await _service.getAllServices(token);
  Future<Either<ErrorModel, List<GetAllServiceModel>>> getServicesServiceProvider(
          String token, GetServiceProviderServicesReuqestModel model) async =>
      await _service.getServicesByServiceProvider(model, token);
  Future<Either<ErrorModel, List<GetAllServiceModel>>> getFilteredServices(
          String token, FilterServiceRequestModel model) async =>
      await _service.getFilteredServices(token, model);
}
