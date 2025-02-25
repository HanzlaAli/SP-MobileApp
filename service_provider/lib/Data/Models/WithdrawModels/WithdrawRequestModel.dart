class WithdrawRequestModel {
  CreateWithdrawalRequestModel? createWithdrawalRequestModel;

  WithdrawRequestModel({this.createWithdrawalRequestModel});

  WithdrawRequestModel.fromJson(Map<String, dynamic> json) {
    createWithdrawalRequestModel = json['createWithdrawalRequestModel'] != null
        ? CreateWithdrawalRequestModel.fromJson(
            json['createWithdrawalRequestModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (createWithdrawalRequestModel != null) {
      data['createWithdrawalRequestModel'] =
          createWithdrawalRequestModel!.toJson();
    }
    return data;
  }
}

class CreateWithdrawalRequestModel {
  int? amount;
  String? serviceProviderEmail;
  String? createOn;
  int? withdrawalStatusId;
  int? approvedById;
  int? withdrawalAccountId;

  CreateWithdrawalRequestModel(
      {this.amount,
      this.serviceProviderEmail,
      this.createOn,
      this.withdrawalStatusId,
      this.approvedById,
      this.withdrawalAccountId});

  CreateWithdrawalRequestModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    serviceProviderEmail = json['serviceProviderEmail'];
    createOn = json['createOn'];
    withdrawalStatusId = json['withdrawalStatusId'];
    approvedById = json['approvedById'];
    withdrawalAccountId = json['withdrawalAccountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['serviceProviderEmail'] = serviceProviderEmail;
    data['createOn'] = createOn;
    data['withdrawalStatusId'] = withdrawalStatusId;
    data['approvedById'] = approvedById;
    data['withdrawalAccountId'] = withdrawalAccountId;
    return data;
  }
}
