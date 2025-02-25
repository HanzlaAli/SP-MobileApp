class GetServiceProviderAppoinmentsModel {
  int? id;
  int? customerId;
  String? customerName;
  int? serviceProviderId;
  String? serviceProviderName;
  String? customerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  Null? rejectionReasonName;
  Null? rejectionDescription;
  bool? isRejected;
  String? appointmentTypeName;

  GetServiceProviderAppoinmentsModel(
      {this.id,
      this.customerId,
      this.customerName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.customerServiceName,
      this.startTime,
      this.endTime,
      this.appointmentStatusName,
      this.date,
      this.rejectionReasonName,
      this.rejectionDescription,
      this.isRejected,
      this.appointmentTypeName});

  GetServiceProviderAppoinmentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    customerServiceName = json['customerServiceName'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['serviceProviderId'] = this.serviceProviderId;
    data['serviceProviderName'] = this.serviceProviderName;
    data['customerServiceName'] = this.customerServiceName;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['appointmentStatusName'] = this.appointmentStatusName;
    data['date'] = this.date;
    data['rejectionReasonName'] = this.rejectionReasonName;
    data['rejectionDescription'] = this.rejectionDescription;
    data['isRejected'] = this.isRejected;
    data['appointmentTypeName'] = this.appointmentTypeName;
    return data;
  }
}
