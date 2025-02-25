import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/FireBase/ServiceProviderRepo.dart';
import '../../Data/Models/FireBaseUserModel/UserModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ServiceProviderService {
  final serviceProviderRepo = ServiceProviderRepo();
  Future<Either<ErrorModel, SuccessModel>> addServiceProvider(UserModel model) async {
    int res = await serviceProviderRepo.save(model.uId, 'Users', model.toSnapShot());
    if (res == 200) {
      return right(SuccessModel(code: 200, message: 'User Added!'));
    } else {
      return left(ErrorModel(code: 500, message: 'User Not Added!'));
    }
  }

  Future<Either<ErrorModel, UserModel>> getServiceProvider(String uId) async {
    Either<int, DocumentSnapshot> res =
        await serviceProviderRepo.getDocument(uId, 'Users');
    return res.fold(
        (l) => left(ErrorModel()), (r) => right(UserModel.fromSnapShot(r)));
  }

  
}
