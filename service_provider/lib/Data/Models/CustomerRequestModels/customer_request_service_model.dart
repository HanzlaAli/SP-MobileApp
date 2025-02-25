class CustomerRequestServiceModel {
  late int id;
  int? customerId;
  String? title;
  String? serviceType;
  String? description;
  List<String>? images;
  int? budget;

  CustomerRequestServiceModel(
      {required this.id,
      this.customerId,
      this.title,
      this.serviceType,
      this.description,
      this.images,
      this.budget});

  CustomerRequestServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customerId'];
    title = json['title'];
    serviceType = json['serviceType'];
    description = json['description'];
    images = _getImages(json['images']);
    budget = json['budget'];
  }

  List<String> _getImages(String image) {
    const String baseUrl = 'http://132.148.73.196:81/';
    var images = image.split(';').map((img) => '$baseUrl$img').toList();
    return images;
  }
}
