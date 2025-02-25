class GetBookedAppoinmentRequestModel {
  String? fromDate;
  String? toDate;
  String? email;

  GetBookedAppoinmentRequestModel(
      {required this.fromDate, required this.toDate, required this.email});

  GetBookedAppoinmentRequestModel.fromJson(Map<String, dynamic> json) {
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fromDate'] = fromDate;
    data['toDate'] = toDate;
    data['email'] = email;
    return data;
  }
}
