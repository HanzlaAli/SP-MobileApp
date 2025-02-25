import 'package:dartz/dartz.dart';
import '../../Core/Services/CartService.dart';
import '../../Data/Models/CartModel/AddCartModel.dart';
import '../../Data/Models/CartModel/DeleteCartModel.dart';
import '../../Data/Models/CartModel/GetCartModel.dart';
import '../../Data/Models/CheckOutModel/CheckOutModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class CartController {
  final cartService = CartService();
  Future<Either<ErrorModel, SuccessModel>> addCart(
          AddCartModel addCartModel, String token) async =>
      cartService.addCart(addCartModel, token);
  Future<Either<ErrorModel, SuccessModel>> checkOut(
          CheckoutModel checkOutModel, String token) async =>
      cartService.checkOut(checkOutModel, token);

  Future<Either<ErrorModel, SuccessModel>> deleteCart(
          DeleteCartModel deleteCartModel, String token) async =>
      cartService.deleteCart(deleteCartModel, token);

  Future<Either<ErrorModel, List<GetCartModel>>> getCart(String token) async =>
      cartService.getCart(token);
}
