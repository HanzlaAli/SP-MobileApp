// ignore_for_file: depend_on_referenced_packages, file_names
import 'dart:convert';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/Api/CartRepo.dart';
import 'package:http/http.dart' as http;
import '../../Data/Models/CartModel/AddCartModel.dart';
import '../../Data/Models/CartModel/DeleteCartModel.dart';
import '../../Data/Models/CartModel/GetCartModel.dart';
import '../../Data/Models/CheckOutModel/CheckOutModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class CartService {
  final cartRepo = CartRepo();

  Future<Either<ErrorModel, SuccessModel>> addCart(
      AddCartModel model, String token) async {
    http.Response response = await cartRepo.post(
        url: cartRepo.addCart, body: model.toJson(), token: token);
    var res = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> checkOut(
      CheckoutModel model, String token) async {
    var data = model.toJson();
    http.Response response =
        await cartRepo.post(url: cartRepo.checkOut, body: data, token: token);
    var res = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> deleteCart(
      DeleteCartModel model, String token) async {
    http.Response response = await cartRepo.post(
        url: cartRepo.deleteCart, body: model.toJson(), token: token);
    var res = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return right(SuccessModel());
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }

  Future<Either<ErrorModel, List<GetCartModel>>> getCart(String token) async {
    http.Response response =
        await cartRepo.get(url: cartRepo.getCartList, token: token);
    var res = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List<GetCartModel> list = [];
      var res = jsonDecode(response.body);
      for (var data in res) {
        list.add(GetCartModel.fromJson(data));
      }
      return right(list);
    } else {
      return left(ErrorModel(message: res['message']));
    }
  }
}
