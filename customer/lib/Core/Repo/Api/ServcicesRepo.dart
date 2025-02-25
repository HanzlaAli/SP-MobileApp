import 'Base/RepoBase.dart';

class ServiceRepo extends RepoBase {
  final getAllServices = "Service/GetList";
  final getFilteredServices = "Service/GetFilteredList";
  final getServicesByServiceProvider = "Service/GetListByServiceProvider";
}
