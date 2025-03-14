class CreateInsuranceModel {
  int? insuranceType;
  String? coverageDetails;
  String? startDate;
  String? expiryDate;
  String? insuranceProviderName;
  String? policyNumber;
  int? coverageLimit;
  int? deductible;
  String? serviceProviderEmail;

  CreateInsuranceModel(
      {this.insuranceType,
      this.coverageDetails,
      this.startDate,
      this.expiryDate,
      this.insuranceProviderName,
      this.policyNumber,
      this.coverageLimit,
      this.deductible,
      this.serviceProviderEmail});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['insuranceType'] = insuranceType;
    data['coverageDetails'] = coverageDetails;
    data['startDate'] = startDate;
    data['expiryDate'] = expiryDate;
    data['insuranceProviderName'] = insuranceProviderName;
    data['policyNumber'] = policyNumber;
    data['coverageLimit'] = coverageLimit;
    data['deductible'] = deductible;
    data['serviceProviderEmail'] = serviceProviderEmail;
    return data;
  }
}
