class GetCustomerAppoinmentsModel {
  int? id;
  int? CustomerId;
  String? CustomerName;
  int? serviceProviderId;
  String? serviceProviderName;
  String? CustomerServiceName;
  String? startTime;
  String? endTime;
  String? appointmentStatusName;
  String? date;
  Null? rejectionReasonName;
  Null? rejectionDescription;
  bool? isRejected;
  String? appointmentTypeName;

  GetCustomerAppoinmentsModel(
      {this.id,
      this.CustomerId,
      this.CustomerName,
      this.serviceProviderId,
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

  GetCustomerAppoinmentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    CustomerId = json['CustomerId'];
    CustomerName = json['CustomerName'];
    serviceProviderId = json['serviceProviderId'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['CustomerId'] = this.CustomerId;
    data['CustomerName'] = this.CustomerName;
    data['serviceProviderId'] = this.serviceProviderId;
    data['serviceProviderName'] = this.serviceProviderName;
    data['CustomerServiceName'] = this.CustomerServiceName;
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
