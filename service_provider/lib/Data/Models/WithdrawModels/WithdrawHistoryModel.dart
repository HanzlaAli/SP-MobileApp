class WithdrawHistoryModel {
  int? amount;
  int? serviceProviderId;
  String? serviceProviderName;
  String? createOn;
  int? withdrawalStatusId;
  String? withDrawalStatus;
  int? approvedById;
  String? approvedBy;
  int? withdrawalAccountId;
  String? withDrawalAccount;
  int? id;

  WithdrawHistoryModel(
      {this.amount,
      this.serviceProviderId,
      this.serviceProviderName,
      this.createOn,
      this.withdrawalStatusId,
      this.withDrawalStatus,
      this.approvedById,
      this.approvedBy,
      this.withdrawalAccountId,
      this.withDrawalAccount,
      this.id});

  WithdrawHistoryModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    createOn = json['createOn'];
    withdrawalStatusId = json['withdrawalStatusId'];
    withDrawalStatus = json['withDrawalStatus'];
    approvedById = json['approvedById'];
    approvedBy = json['approvedBy'];
    withdrawalAccountId = json['withdrawalAccountId'];
    withDrawalAccount = json['withDrawalAccount'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['serviceProviderId'] = serviceProviderId;
    data['serviceProviderName'] = serviceProviderName;
    data['createOn'] = createOn;
    data['withdrawalStatusId'] = withdrawalStatusId;
    data['withDrawalStatus'] = withDrawalStatus;
    data['approvedById'] = approvedById;
    data['approvedBy'] = approvedBy;
    data['withdrawalAccountId'] = withdrawalAccountId;
    data['withDrawalAccount'] = withDrawalAccount;
    data['id'] = id;
    return data;
  }
}
