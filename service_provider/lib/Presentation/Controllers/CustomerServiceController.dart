import 'package:dartz/dartz.dart';
import '../../Core/Services/CustomerServicesService.dart';
import '../../Data/Models/CustomerModels/GetCustomerBookedServices.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class CustomerServiceController {
  final _service = CustomerServicesService();
  Future<Either<ErrorModel, List<GetCustomerBookedServiceModel>>> getAllServices(
          String token) async =>
      await _service.getAllBookedServices(token);
}
