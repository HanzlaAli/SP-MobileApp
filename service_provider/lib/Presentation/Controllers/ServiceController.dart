import 'package:dartz/dartz.dart';
import '../../Core/Services/ServicesService.dart';
import '../../Data/Models/ServiceProvider/GetServiceProviderServiceRequestModel.dart';
import '../../Data/Models/ServicesModels/DeleteServicesModel.dart';
import '../../Data/Models/ServicesModels/create_or_edit_service_model.dart';
import '../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../Data/Models/ServicesModels/delete_service_image_model.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceController {
  final servicesService = ServicesService();
  Future<Either<ErrorModel, SuccessModel>> addService(
          CreateOrEditServiceModel addServicesModel, String token) async =>
      servicesService.addService(addServicesModel, token);

  Future<Either<ErrorModel, SuccessModel>> deleteService(
          DeleteServiceModel deleteServiceModel, String token) async =>
      servicesService.deleteService(deleteServiceModel, token);

  Future<Either<ErrorModel, SuccessModel>> deleteServiceImage(
          DeleteServiceImageModel deleteServiceModel, String token) async =>
      servicesService.deleteServiceImage(deleteServiceModel, token);

  Future<Either<ErrorModel, SuccessModel>> updateService(
          CreateOrEditServiceModel updateServiceModel, String token) async =>
      servicesService.updateService(updateServiceModel, token);

  Future<Either<ErrorModel, List<GetServicesModel>>> getServices(
          String token, GetServiceProviderServicesReuqestModel model) async =>
      servicesService.getServices(token, model);
}
