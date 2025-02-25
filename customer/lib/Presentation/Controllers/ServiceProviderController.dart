import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProvidersService.dart';
import '../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
import '../../Core/Services/ServiceProviderService.dart';
import '../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceProviderController {
  final service = ServiceProvidersService();
  final serviceProviderService = ServiceProviderService();
  Future<Either<ErrorModel, List<GetServiceProvidersModel>>> getServiceProviders(
          String token) async =>
      service.getServiceProviders(token);
  Future<Either<ErrorModel, SuccessModel>> addServiceProvider(UserModel model) async =>
      serviceProviderService.addServiceProvider(model);
  Future<Either<ErrorModel, UserModel>> getServiceProviderByIdFromFirebase(
          String uId) async =>
      await serviceProviderService.getServiceProvider(uId);
}
