import 'dart:io';
import 'Base/RepoBase.dart';
import 'package:http/http.dart' as http;
import '../../../Data/Models/CustomerRequestModels/create_or_update_customer_service_request.dart';

class CustomerRequestRepo extends RepoBase {
  final createCustomerRequestPath = 'CustomerServiceRequest/Create';
  final updateCustomerRequestPath = 'CustomerServiceRequest/Update';
  final deletePictureCustomerRequestPath = 'CustomerServiceRequest/DeleteImage';
  final deleteCustomerRequestPath = 'CustomerServiceRequest/';
  final getCustomerRequestPath =
      'CustomerServiceRequest/GetServiceRequestsByCustomer';

  Future<http.Response> createCustomerRequest(
      {required CreateOrUpdateCustomerServiceRequestModel model,
      required String token}) async {
    var uri = Uri.parse(apiUrl + createCustomerRequestPath);
    var request = http.MultipartRequest("POST", uri);

    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    request.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    request.headers[HttpHeaders.connectionHeader] = 'keep-alive';

    // Add text fields
    request.fields["Title"] = model.title.toString();
    request.fields["ServiceTypeId"] = model.serviceTypeId.toString();
    request.fields["Description"] = model.description.toString();
    request.fields["Budget"] = model.budget.toString();
    request.fields["UserEmail"] = "";

    // Add image files
    if (model.images != null) {
      for (var image in model.images!) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          "Images", // Key for the API
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

  Future<http.Response> updateCustomerRequest(
      {required CreateOrUpdateCustomerServiceRequestModel model,
      required String token}) async {
    var uri = Uri.parse(apiUrl + updateCustomerRequestPath);
    var request = http.MultipartRequest("PUT", uri);

    request.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    request.headers[HttpHeaders.contentTypeHeader] = 'multipart/form-data';
    request.headers[HttpHeaders.connectionHeader] = 'keep-alive';

    // Add text fields
    request.fields["Id"] = model.id.toString();
    request.fields["Title"] = model.title.toString();
    request.fields["ServiceTypeId"] = model.serviceTypeId.toString();
    request.fields["Description"] = model.description.toString();
    request.fields["Budget"] = model.budget.toString();
    request.fields["UserEmail"] = "";

    // Add image files
    if (model.images != null) {
      for (var image in model.images!) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        var multipartFile = http.MultipartFile(
          "Images", // Key for the API
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
