class CreateWithdrawAccountRequestModel {
  CreateWithdrawalAccountModel? createWithdrawalAccountModel;

  CreateWithdrawAccountRequestModel({this.createWithdrawalAccountModel});

  CreateWithdrawAccountRequestModel.fromJson(Map<String, dynamic> json) {
    createWithdrawalAccountModel = json['createWithdrawalAccountModel'] != null
        ? CreateWithdrawalAccountModel.fromJson(
            json['createWithdrawalAccountModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createWithdrawalAccountModel != null) {
      data['createWithdrawalAccountModel'] =
          createWithdrawalAccountModel!.toJson();
    }
    return data;
  }
}

class CreateWithdrawalAccountModel {
  String? creditCardNumber;
  String? expiryDate;
  int? cvc;

  CreateWithdrawalAccountModel(
      {this.creditCardNumber, this.expiryDate, this.cvc});

  CreateWithdrawalAccountModel.fromJson(Map<String, dynamic> json) {
    creditCardNumber = json['creditCardNumber'];
    expiryDate = json['expiryDate'];
    cvc = json['cvc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['creditCardNumber'] = creditCardNumber;
    data['expiryDate'] = expiryDate;
    data['cvc'] = cvc;
    return data;
  }
}
