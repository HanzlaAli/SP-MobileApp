import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../Core/Repo/Api/TherapyTypeRepo.dart';
import '../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';

class TherapyTypeService {
  TherapyTypeRepo repo = TherapyTypeRepo();

  Future<Either<ErrorModel, List<TherapyTypeResponseModel>>> getTherapyType(
      String? token) async {
    Response response = await repo.get(token: token, url: repo.getTherapyType);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<TherapyTypeResponseModel> list = [];
      var res = jsonDecode(response.body);
      for (var items in res) {
        list.add(TherapyTypeResponseModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel());
    }
  }
}
