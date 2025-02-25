import '../../../Core/Repo/Api/Base/RepoBase.dart';

class ServiceRepo extends RepoBase {
  final addService = 'Service/Create';
  final getServices = 'Service/GetListByServiceProvider';
  final deleteServices = 'Service/Delete';
  final updateServices = 'Service/Update';
}
