class UpdateServiceProviderAvailabilityModel {
  List<ServiceProviderAvailability>? serviceProviderAvailability;

  UpdateServiceProviderAvailabilityModel({this.serviceProviderAvailability});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (serviceProviderAvailability != null) {
      data['serviceProviderAvailability'] =
          serviceProviderAvailability!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceProviderAvailability {
  int? id;
  int? dayOfWeek;
  String? startTime;
  String? endTime;

  ServiceProviderAvailability({
    this.id,
    this.dayOfWeek,
    this.startTime,
    this.endTime,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayOfWeek'] = dayOfWeek;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    return data;
  }
}
