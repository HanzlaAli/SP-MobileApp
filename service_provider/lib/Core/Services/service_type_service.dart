import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:mended_soluctions/Core/Repo/Api/service_type_repo.dart';
import 'package:mended_soluctions/Data/Models/service_type/service_type_model.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class ServiceTypeService {
  ServiceTypeRepo repo = ServiceTypeRepo();

  Future<Either<ErrorModel, List<ServiceTypeModel>>> getTherapyType(
      String? token) async {
    Response response = await repo.get(
      token: token,
      url: repo.getServiceType,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<ServiceTypeModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(
          ServiceTypeModel.fromJson(
            items,
          ),
        );
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }
}
