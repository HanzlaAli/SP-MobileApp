// ignore_for_file: file_names
import 'package:dartz/dartz.dart';
import '../../Core/Services/SetUpProfileService.dart';
import '../../Data/Models/CustomerModel/CustomerProfileModel.dart';
import '../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/CustomerModel/GetCustomerDetails.dart';
import '../../Data/Models/CustomerModel/UpdateProfileModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class SetUpProfileController {
  final _setUpProfileServices = SetUpProfileServices();

  Future<Either<ErrorModel, GetCustomerDetailsModel>> getCustomerDetails(
          String token) async =>
      await _setUpProfileServices.getCustomerDetails(token);

  Future<Either<ErrorModel, CustomerProfileModel>> getCustomerProfile(
      String token) async {
    Either<ErrorModel, CustomerProfileModel> response =
        await _setUpProfileServices.getCustomerProfile(token);
    return response;
  }

  Future<Either<ErrorModel, CustomerProfileModel>> setCustomerProfile(
      String token, SetUpCustomerProfileModel model) async {
    Either<ErrorModel, CustomerProfileModel> response =
        await _setUpProfileServices.setCustomerProfile(model, token);
    return response;
  }

  Future<Either<ErrorModel, SuccessModel>> updateProfile(
      String? token, UpdateProfileModel model) async {
    Either<ErrorModel, SuccessModel> response =
        await _setUpProfileServices.updateProfile(token, model);
    return response;
  }
}
