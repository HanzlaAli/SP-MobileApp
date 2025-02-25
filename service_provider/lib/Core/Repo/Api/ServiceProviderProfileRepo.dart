// ignore_for_file: file_names

import 'dart:io';
import '../../../Core/Repo/Api/Base/RepoBase.dart';
import 'package:http/http.dart' as http;

class ServiceProviderProfileRepo extends RepoBase {
  final getServiceProviderProfile = 'ServiceProvider/GetServiceProviderProfile';
  final getServiceProviderDetails = 'ServiceProvider/GetServiceProviderDetails';
  final updateServiceProviderProfile = 'ServiceProvider/UpdateProfilePicture';

  Future<http.StreamedResponse> updateProfile(
      {required File img, required String token}) async {
    var req = await http.MultipartRequest(
      'POST',
      Uri.parse(apiUrl + updateServiceProviderProfile),
    );
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    req.headers['Content-Type'] = 'multipart/form-data';
    req.headers['Connection'] = 'keep-alive';
    req.files.add(await http.MultipartFile.fromPath(
      'ProfilePictureFile',
      img.path,
    ));
    req.fields['ProfilePicture'] = "";
    req.fields['UserEmail'] = "";
    var response = await req.send();
    final res = await http.Response.fromStream(response);

    return response;
  }
}
