class DeleteCartModel {
  int? cartId;

  DeleteCartModel({this.cartId});

  DeleteCartModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cartId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cartId'] = cartId;
    return data;
  }
}
