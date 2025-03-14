class InsuranceModel {
  int? id;
  int? insuranceType;
  String? coverageDetails;
  String? startDate;
  String? expiryDate;
  String? insuranceProviderName;
  String? policyNumber;
  int? coverageLimit;
  int? deductible;
  int? serviceProviderId;

  InsuranceModel(
      {this.id,
      this.insuranceType,
      this.coverageDetails,
      this.startDate,
      this.expiryDate,
      this.insuranceProviderName,
      this.policyNumber,
      this.coverageLimit,
      this.deductible,
      this.serviceProviderId});

  InsuranceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insuranceType = json['insuranceType'];
    coverageDetails = json['coverageDetails'];
    startDate = json['startDate'];
    expiryDate = json['expiryDate'];
    insuranceProviderName = json['insuranceProviderName'];
    policyNumber = json['policyNumber'];
    coverageLimit = json['coverageLimit'];
    deductible = json['deductible'];
    serviceProviderId = json['serviceProviderId'];
  }
}
