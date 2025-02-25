import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderService.dart';
import '../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceProviderController {
  final service = ServiceProviderService();
  Future<Either<ErrorModel, SuccessModel>> addServiceProvider(UserModel model) async =>
      service.addServiceProvider(model);
  Future<Either<ErrorModel, UserModel>> getServiceProviderByIdFromFirebase(
          String uId) async =>
      await service.getServiceProvider(uId);
}
