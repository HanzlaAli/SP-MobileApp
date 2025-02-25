import '../../../Core/Repo/Api/Base/RepoBase.dart';

class WithdrawRepo extends RepoBase {
  final getWithdrawsHistory = 'WithDrawalRequest/GetListByServiceProvider';
  final withdrawRequest = 'WithDrawalRequest/Create';
  final createWithdrawAccount = 'WithDrawalAccount/Create';
}
