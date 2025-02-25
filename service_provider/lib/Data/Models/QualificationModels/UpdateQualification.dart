class UpdateQualificationModel {
  int? id;
  String? name;
  String? institutionName;
  String? procurementYear;

  UpdateQualificationModel(
      {this.id, this.name, this.institutionName, this.procurementYear});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['institutionName'] = institutionName;
    data['procurementYear'] = procurementYear;
    return data;
  }
}
