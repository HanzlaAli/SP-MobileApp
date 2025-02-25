class CheckoutModel {
  CheckOutModel? checkOutModel;

  CheckoutModel({this.checkOutModel});

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    checkOutModel = json['checkOutModel'] != null
        ? CheckOutModel.fromJson(json['checkOutModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (checkOutModel != null) {
      data['checkOutModel'] = checkOutModel!.toJson();
    }
    return data;
  }
}

class CheckOutModel {
  String? cardNumber;
  String? expirationYear;
  String? expirationMonth;
  String? cvc;
  String? startTime;
  String? endTime;
  String? date;
  int? appointmentTypeId;
  String? CustomerEmail;
  int? serviceId;

  CheckOutModel(
      {this.cardNumber,
      this.expirationYear,
      this.expirationMonth,
      this.cvc,
      this.startTime,
      this.endTime,
      this.date,
      this.appointmentTypeId,
      this.CustomerEmail,
      this.serviceId});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    cardNumber = json['cardNumber'];
    expirationYear = json['expirationYear'];
    expirationMonth = json['expirationMonth'];
    cvc = json['cvc'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    appointmentTypeId = json['appointmentTypeId'];
    CustomerEmail = json['CustomerEmail'];
    serviceId = json['serviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cardNumber'] = cardNumber;
    data['expirationYear'] = expirationYear;
    data['expirationMonth'] = expirationMonth;
    data['cvc'] = cvc;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['date'] = date;
    data['appointmentTypeId'] = appointmentTypeId;
    data['CustomerEmail'] = CustomerEmail;
    data['serviceId'] = serviceId;
    return data;
  }
}
