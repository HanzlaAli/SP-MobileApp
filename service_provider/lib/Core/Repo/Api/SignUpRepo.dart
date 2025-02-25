// ignore_for_file: file_names

import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../Core/Repo/Api/Base/RepoBase.dart';
import '../../../Data/Models/ProfileModels/SetUpProfileModel.dart';

class SignUpRepo extends RepoBase {
  final serviceProviderCreate = 'ServiceProvider/Create';
  final serviceProviderSpecialization = 'ServiceProviderSpecialization/Create';
  final serviceProviderTherapy = 'ServiceProviderTherapy/Create';
  final serviceProviderAvilability = 'DboctorAvilability/Create';
  final setUpProfile = 'ServiceProvider/SetupProfile';

  Future<http.Response> setServiceProviderProfile(
      {required SetUpProfileModel model, required String token}) async {
    var req = http.MultipartRequest(
      'POST',
      Uri.parse(apiUrl + setUpProfile),
    );
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    req.headers['Content-Type'] = 'multipart/form-data';
    req.headers['Connection'] = 'keep-alive';
    req.files.add(
      http.MultipartFile(
          'ProfilePictureFile',
          File(model.profilePictureFile!.path.toString())
              .readAsBytes()
              .asStream(),
          File(model.profilePictureFile!.path).lengthSync(),
          filename: model.profilePictureFile!.path.split('/').last),
    );
    req.fields['Bio'] = model.bio.toString();
    req.fields['Gender'] = model.gender.toString();
    req.fields['BusinessAddress'] = model.businessAddress.toString();
    req.fields['BusinessPhoneNumber'] = model.businessPhoneNumber.toString();
    req.fields['StreetAddress'] = model.streetAddress.toString();
    req.fields['City'] = model.city.toString();
    req.fields['State'] = model.state.toString();
    req.fields['DateOfBirth'] = model.dateOfBirth.toString();
    req.fields['Zip'] = model.zip.toString();
    var response = await req.send();
    final res = await http.Response.fromStream(response);

    return res;
  }
}
