import 'package:dartz/dartz.dart';
import '../../Core/Services/TherapyTypeService.dart';

import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/TherapyType/TherapyTypeModel.dart';

class TherapyTypeController {
  final therapyTypeService = TherapyTypeService();
  Future<Either<ErrorModel, List<TherapyTypeResponseModel>>> getTherapyType(
          String? token) async =>
      therapyTypeService.getTherapyType(token);
}
