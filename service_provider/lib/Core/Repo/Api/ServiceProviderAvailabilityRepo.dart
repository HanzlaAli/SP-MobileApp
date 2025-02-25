import '../../../Core/Repo/Api/Base/RepoBase.dart';

class ServiceProviderAvailibilityRepo extends RepoBase {
  final addServiceProviderAvailability = 'ServiceProviderAvilability/Create';
  final getServiceProviderAvailability = 'ServiceProviderAvilability/GetListByServiceProvider';
  final deleteServiceProviderAvailability = 'ServiceProviderAvilability/Delete';
  final updateServiceProviderAvailability = 'ServiceProviderAvilability/Update';
}
