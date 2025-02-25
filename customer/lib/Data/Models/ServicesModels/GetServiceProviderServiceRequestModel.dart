class GetServiceProviderServicesReuqestModel {
  String? serviceProviderEmail;

  GetServiceProviderServicesReuqestModel({this.serviceProviderEmail});

  GetServiceProviderServicesReuqestModel.fromJson(Map<String, dynamic> json) {
    serviceProviderEmail = json['serviceProviderEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceProviderEmail'] = serviceProviderEmail;
    return data;
  }
}
