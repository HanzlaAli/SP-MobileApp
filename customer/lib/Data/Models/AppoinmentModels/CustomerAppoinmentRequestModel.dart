class CustomerAppoinmentRequestModel {
  int? CustomerServiceId;

  CustomerAppoinmentRequestModel({this.CustomerServiceId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustomerServiceId'] = CustomerServiceId;
    return data;
  }
}
