import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../../Data/Models/AppointmentDocument/AppointmentDocument.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../Repo/Api/AppoinmentDocumentRepo.dart';

class AppoinmentDocumentService {
  final appoinmentRepo = AppoinmentDocumentRepo();

  Future<Either<ErrorModel, List<AppointmentDocumentModel>>>
      getBookedAppoinments(String? token, DateTime? date) async {
    Response response = await appoinmentRepo.get(
      url: appoinmentRepo.getAppointmentDocumentByCustomer +
          (date == null ? '' : '?Date=$date'),
      token: token,
    );
    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<AppointmentDocumentModel> list = [];
      for (var items in res) {
        list.add(AppointmentDocumentModel.fromJson(items));
      }
      return right(list);
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }
}
