class CreateAppoinmentModel {
  int? CustomerServiceId;
  String? startTime;
  String? endTime;
  String? date;
  int? appointmentTypeId;

  CreateAppoinmentModel(
      {this.CustomerServiceId,
      this.startTime,
      this.endTime,
      this.date,
      this.appointmentTypeId});

  CreateAppoinmentModel.fromJson(Map<String, dynamic> json) {
    CustomerServiceId = json['CustomerServiceId'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    date = json['date'];
    appointmentTypeId = json['appointmentTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustomerServiceId'] = CustomerServiceId;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['date'] = date;
    data['appointmentTypeId'] = appointmentTypeId;
    return data;
  }
}
