// ignore_for_file: file_names

import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../Core/Services/ServiceProviderProfileService.dart';
import '../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Data/Models/ServiceProvider/GetServiceProviderDetailsModel.dart';

class ServiceProviderProfileController {
  final _serviceProviderProfileServices = ServiceProviderProfileServices();

  Future<Either<ErrorModel, ServiceProviderProfileModel>> getServiceProviderProfile(
          String token) async =>
      await _serviceProviderProfileServices.getServiceProviderProfile(token);

  Future<Either<ErrorModel, GetServiceProviderDetailsModel>> getServiceProviderDetails(
          String token) async =>
      await _serviceProviderProfileServices.getServiceProviderDetails(token);

  Future<Either<ErrorModel, SuccessModel>> updateServiceProviderProfile(
          File img, String token) async =>
      await _serviceProviderProfileServices.updateServiceProviderProfile(token, img);
}
