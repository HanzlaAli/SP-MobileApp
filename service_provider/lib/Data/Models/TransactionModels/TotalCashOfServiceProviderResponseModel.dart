class TotalCashOfServiceProviderResponseModel {
  var amount;

  TotalCashOfServiceProviderResponseModel({this.amount});

  TotalCashOfServiceProviderResponseModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'] == 0 ? 0.0 : json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    return data;
  }
}
