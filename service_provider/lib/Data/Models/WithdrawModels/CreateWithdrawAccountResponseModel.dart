class CreateWithdrawAccountResponseModel {
  int? id;
  String? creditCardNumber;
  String? expiryDate;
  int? cvc;

  CreateWithdrawAccountResponseModel(
      {this.id, this.creditCardNumber, this.expiryDate, this.cvc});

  CreateWithdrawAccountResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditCardNumber = json['creditCardNumber'];
    expiryDate = json['expiryDate'];
    cvc = json['cvc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['creditCardNumber'] = creditCardNumber;
    data['expiryDate'] = expiryDate;
    data['cvc'] = cvc;
    return data;
  }
}