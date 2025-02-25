import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderAvailabilityService.dart';
import '../../Data/Models/ServiceProviderAvailabilityModel/ServiceProviderAvailabilityModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class ServiceProviderAvailabilityController {
  final serviceProviderAvailabilityService = ServiceProviderAvailabilityService();

  Future<Either<ErrorModel, List<ServiceProviderAvailabilityModel>>>
      getServiceProviderAvailabilotyByServiceProviderId(
    String token,
    int id,
    int weekDays,
  ) async =>
          serviceProviderAvailabilityService.getServiceProviderAvailabilotyByServiceProviderId(
              id, weekDays, token);
}
