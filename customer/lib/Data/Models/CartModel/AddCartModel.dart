class AddCartModel {
  CartModel? cartModel;

  AddCartModel({this.cartModel});

  AddCartModel.fromJson(Map<String, dynamic> json) {
    cartModel = json['cartModel'] != null
        ? new CartModel.fromJson(json['cartModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (cartModel != null) {
      data['cartModel'] = cartModel!.toJson();
    }
    return data;
  }
}

class CartModel {
  String? CustomerEmail;
  int? serviceId;

  CartModel({this.CustomerEmail, this.serviceId});

  CartModel.fromJson(Map<String, dynamic> json) {
    CustomerEmail = json['CustomerEmail'];
    serviceId = json['serviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustomerEmail'] = CustomerEmail;
    data['serviceId'] = serviceId;
    return data;
  }
}
