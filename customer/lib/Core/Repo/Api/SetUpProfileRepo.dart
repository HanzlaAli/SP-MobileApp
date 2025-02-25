// ignore_for_file: file_names, depend_on_referenced_packages

import 'dart:io';

import '../../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import 'package:http/http.dart' as http;
import '../Api/Base/RepoBase.dart';

class SetUpProfileRepo extends RepoBase {
  final setUpProfile = "Customer/SetupProfile";
  final getCustomerProfile = "Customer/GetCustomerProfile";
  final updateProfile = "Customer/Update";
  final getCustomerDetails = "Customer/GetCustomerDetails";

  Future<http.Response> serviceProviderLicense(
      {required SetUpCustomerProfileModel model, required String token}) async {
    var req = http.MultipartRequest(
      'POST',
      Uri.parse(apiUrl + setUpProfile),
    );
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    req.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    req.headers[HttpHeaders.connectionHeader] = 'keep-alive';
    req.files.add(await http.MultipartFile.fromPath(
      'ProfilePictureFile',
      model.profilePictureFile!.path,
    ));
    var response = await req.send();
    final res = await http.Response.fromStream(response);
    return res;
  }
}
