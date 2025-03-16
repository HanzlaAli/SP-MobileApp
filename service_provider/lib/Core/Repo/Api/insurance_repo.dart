import 'package:mended_soluctions/Core/Repo/Api/Base/RepoBase.dart';

class InsuranceRepo extends RepoBase {
  final createInsurance = 'ServiceProviderInsurance/Create';
  final updateInsurance = 'ServiceProviderInsurance/Update';
  final getInsurance = 'ServiceProviderInsurance/GetByServiceProviderId';
}
