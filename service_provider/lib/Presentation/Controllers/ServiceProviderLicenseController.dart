import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderLicenseService.dart';
import '../../Data/Models/LicenseModels/GetLicenseTypeModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

import '../../Data/Models/LicenseModels/AddServiceProviderLicense.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class ServiceProviderLicenseController {
  ServiceProviderLicenseService serviceProviderLicenseService = ServiceProviderLicenseService();
  Future<Either<ErrorModel, List<GetLicenseTypeModel>>> getLicenseTypes(
          {required String token}) async =>
      await serviceProviderLicenseService.getLicenseType(token);

  Future<Either<ErrorModel, SuccessModel>> addServiceProviderLicense(
          {required AddServiceProviderLicenseModel model,
          required String token}) async =>
      await serviceProviderLicenseService.addServiceProviderLicense(model, token);

  Future<Either<ErrorModel, SuccessModel>> updateServiceProviderLicense(
      int id, AddServiceProviderLicenseModel model, String token) async {
    return serviceProviderLicenseService.updateServiceProviderLicense(id, model, token);
  }
}
