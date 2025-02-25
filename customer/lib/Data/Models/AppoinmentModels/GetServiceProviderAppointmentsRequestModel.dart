class GetServiceProviderAppointments {
  int? serviceProviderId;
  String? date;

  GetServiceProviderAppointments({this.serviceProviderId, this.date});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['serviceProviderId'] = serviceProviderId;
    data['date'] = date;
    return data;
  }
}
