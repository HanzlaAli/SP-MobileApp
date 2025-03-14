import 'dart:io';
import '../../../Core/Repo/Api/Base/RepoBase.dart';
import 'package:http/http.dart' as http;

import '../../../Data/Models/ServicesModels/create_or_edit_service_model.dart';

class ServiceRepo extends RepoBase {
  final addService = 'Service/Create';
  final getServices = 'Service/GetListByServiceProvider';
  final deleteServices = 'Service/Delete';
  final editService = 'Service/Update';
  final deletePictureCustomerRequestPath = 'Service/DeleteImage';
  final deleteCustomerRequestPath = 'Service/';

  Future<http.Response> createService(
      {required CreateOrEditServiceModel model, required String token}) async {
    var uri = Uri.parse(apiUrl + addService);
    var request = http.MultipartRequest("POST", uri);

    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    request.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    request.headers[HttpHeaders.connectionHeader] = 'keep-alive';

    // Add text fields
    request.fields["Service.Name"] = model.name.toString();
    request.fields["Service.Description"] = model.description.toString();
    request.fields["Service.ServiceProviderServiceTypeId"] =
        model.serviceProviderServiceTypeId.toString();
    request.fields["Service.Charges"] = model.charges.toString();
    request.fields["Service.Discount"] = model.discount.toString();
    request.fields["Service.ValidTill"] = model.validTill.toString();
    request.fields["Service.ServiceProviderEmail"] = "";

    // Add image files
    if (model.images != null) {
      for (var image in model.images!) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          "Service.Images", // Key for the API
          stream,
          length,
          filename: image.path,
        );
        request.files.add(multipartFile);
      }
    }

    // Send request
    var response = await request.send();

    final res = await http.Response.fromStream(response);

    return res;
  }

  Future<http.Response> updateService(
      {required CreateOrEditServiceModel model, required String token}) async {
    var uri = Uri.parse(apiUrl + editService);
    var request = http.MultipartRequest("PUT", uri);

    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    request.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    request.headers[HttpHeaders.connectionHeader] = 'keep-alive';

    // Add text fields
    request.fields["Id"] = model.id.toString();
    request.fields["Service.Name"] = model.name.toString();
    request.fields["Service.Description"] = model.description.toString();
    request.fields["Service.ServiceProviderServiceTypeId"] =
        model.serviceProviderServiceTypeId.toString();
    request.fields["Service.Charges"] = model.charges.toString();
    request.fields["Service.Discount"] = model.discount.toString();
    request.fields["Service.ValidTill"] = model.validTill.toString();
    request.fields["Service.ServiceProviderEmail"] = "";

    // Add image files
    if (model.images != null) {
      for (var image in model.images!) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          "Service.Images", // Key for the API
          stream,
          length,
          filename: image.path,
        );
        request.files.add(multipartFile);
      }
    }

    // Send request
    var response = await request.send();

    final res = await http.Response.fromStream(response);

    return res;
  }
}
