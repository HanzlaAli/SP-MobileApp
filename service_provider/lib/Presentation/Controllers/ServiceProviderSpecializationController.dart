import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderSpecializationService.dart';
import '../../Data/Models/SpecializationModel/AddServiceProviderSpecializationModel.dart';
import '../../Data/Models/SpecializationModel/GetSpecialization.dart';

import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceProviderSpecializationController {
  ServiceProviderSpecializationService serviceProviderSpecializationService =
      ServiceProviderSpecializationService();
  Future<Either<ErrorModel, List<GetSpecializationModel>>> getSpecialization(
          {required String token}) async =>
      await serviceProviderSpecializationService.getSpecializations(token);

  Future<Either<ErrorModel, SuccessModel>> addSpecialization(
          {required AddServiceProviderSpecializationModel model,
          required String token}) async =>
      await serviceProviderSpecializationService.addSpecialization(model, token);
}
