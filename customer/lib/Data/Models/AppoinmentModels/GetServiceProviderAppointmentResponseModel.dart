class GetServiceProviderAppointmentsResponseModel {
  int? id;
  String? CustomerName;
  String? serviceProviderName;
  String? CustomerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  String? rejectionReasonName;
  String? rejectionDescription;
  bool? isRejected;
  String? appointmentTypeName;

  GetServiceProviderAppointmentsResponseModel(
      {this.id,
      this.CustomerName,
      this.serviceProviderName,
      this.CustomerServiceName,
      this.startTime,
      this.endTime,
      this.appointmentStatusName,
      this.date,
      this.rejectionReasonName,
      this.rejectionDescription,
      this.isRejected,
      this.appointmentTypeName});

  GetServiceProviderAppointmentsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    CustomerName = json['CustomerName'];
    serviceProviderName = json['serviceProviderName'];
    CustomerServiceName = json['CustomerServiceName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    appointmentStatusName = json['appointmentStatusName'];
    date = json['date'];
    rejectionReasonName = json['rejectionReasonName'];
    rejectionDescription = json['rejectionDescription'];
    isRejected = json['isRejected'];
    appointmentTypeName = json['appointmentTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['CustomerName'] = CustomerName;
    data['serviceProviderName'] = serviceProviderName;
    data['CustomerServiceName'] = CustomerServiceName;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['appointmentStatusName'] = appointmentStatusName;
    data['date'] = date;
    data['rejectionReasonName'] = rejectionReasonName;
    data['rejectionDescription'] = rejectionDescription;
    data['isRejected'] = isRejected;
    data['appointmentTypeName'] = appointmentTypeName;
    return data;
  }
}
