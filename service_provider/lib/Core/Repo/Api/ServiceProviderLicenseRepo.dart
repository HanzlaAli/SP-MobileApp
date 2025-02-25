import 'dart:io';
import '../../../Core/Repo/Api/Base/RepoBase.dart';
import 'package:http/http.dart' as http;
import '../../../Data/Models/LicenseModels/AddServiceProviderLicense.dart';

class ServiceProviderLicenseRepo extends RepoBase {
  final getLicenseType = "LicenseType/GetList";
  final addServiceProviderLicense = "ServiceProviderLicense/Insert";
  final updateServiceProviderLicenseUrl = "ServiceProviderLicense/Update";

  Future<http.StreamedResponse> serviceProviderLicense(
      {required AddServiceProviderLicenseModel model, required String token}) async {
    var req = await http.MultipartRequest(
      'POST',
      Uri.parse(apiUrl + addServiceProviderLicense),
    );
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    req.headers['Content-Type'] = 'multipart/form-data';
    req.headers['Connection'] = 'keep-alive';
    req.files.add(await http.MultipartFile.fromPath(
      'FrontImageFile',
      model.frontImageFile?.path ?? "",
    ));
    req.files.add(await http.MultipartFile.fromPath(
      'BackImageFile',
      model.backImageFile?.path ?? "",
    ));
    req.fields['ServiceProviderEmail'] = model.serviceProviderEmail.toString();

    req.fields['Board'] = model.board.toString();
    req.fields['Number'] = model.number.toString();
    req.fields['IssueDate'] = model.issueDate.toString();
    req.fields['ExpiryDate'] = model.expiryDate.toString();
    req.fields['LicenseTypeId'] = model.licenseTypeId.toString();
    req.fields['FrontImage'] = model.frontImage.toString();
    req.fields['BackImage'] = model.backImage.toString();
    var response = await req.send();
    final res = await http.Response.fromStream(response);

    return response;
  }

  Future<http.StreamedResponse> updateServiceProviderLicense(
      {required int id,
      required AddServiceProviderLicenseModel model,
      required String token}) async {
    var req = await http.MultipartRequest(
      'PUT',
      Uri.parse(apiUrl + updateServiceProviderLicenseUrl),
    );
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    req.headers['Content-Type'] = 'multipart/form-data';
    req.headers['Connection'] = 'keep-alive';
    if (model.frontImageFile?.path != null) {
      req.files.add(await http.MultipartFile.fromPath(
        'FrontImageFile',
        model.frontImageFile?.path ?? "",
      ));
    }
    if (model.backImageFile?.path != null) {
      req.files.add(await http.MultipartFile.fromPath(
        'BackImageFile',
        model.backImageFile?.path ?? "",
      ));
    }
    req.fields['ServiceProviderEmail'] = model.serviceProviderEmail.toString();

    req.fields['Id'] = id.toString();
    req.fields['Board'] = model.board.toString();
    req.fields['Number'] = model.number.toString();
    req.fields['IssueDate'] = model.issueDate.toString();
    req.fields['ExpiryDate'] = model.expiryDate.toString();
    req.fields['LicenseTypeId'] = model.licenseTypeId.toString();
    req.fields['FrontImage'] = model.frontImage.toString();
    req.fields['BackImage'] = model.backImage.toString();
    var response = await req.send();
    final res = await http.Response.fromStream(response);

    return response;
  }
}
