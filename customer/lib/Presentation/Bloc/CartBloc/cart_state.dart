part of 'cart_bloc.dart';

abstract class CartStateBase {}

class CartInitial extends CartStateBase {}

class CartLoading extends CartStateBase {}

class CartSucess extends CartStateBase {}

class CartLoaded extends CartStateBase {
  List<GetCartModel>? model;
  CartLoaded({this.model});
}

class CartError extends CartStateBase {}
