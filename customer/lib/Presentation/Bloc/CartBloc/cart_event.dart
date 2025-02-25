part of 'cart_bloc.dart';

abstract class CartEventBase {}

class AddCartEvent extends CartEventBase {
  AddCartModel? model;
  AddCartEvent({this.model});
}

class CheckOutEvent extends CartEventBase {
  CheckoutModel? model;
  CreateChatHeadModel chatHeadModel;
  CheckOutEvent({this.model, required this.chatHeadModel});
}

class GetCartEvent extends CartEventBase {}

class DeleteCartEvent extends CartEventBase {
  DeleteCartModel? model;
  DeleteCartEvent({this.model});
}
