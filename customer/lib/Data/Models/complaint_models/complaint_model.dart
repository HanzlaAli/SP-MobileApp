class ComplaintModel {
  int? id;
  String? title;
  String? description;
  String? userType;
  int? userId;
  String? userName;
  String? userEmail;
  int? status;

  ComplaintModel(
      {this.id,
      this.title,
      this.description,
      this.userType,
      this.userId,
      this.userName,
      this.userEmail,
      this.status});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userType = json['userType'];
    userId = json['userId'];
    userName = json['userName'];
    userEmail = json['userEmail'];
    status = json['status'];
  }
}
