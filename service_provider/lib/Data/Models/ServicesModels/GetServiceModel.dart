class GetServicesModel {
  int? id;
  String? name;
  String? description;
  String? therapyName;
  int? serviceProviderId;
  String? serviceProviderName;
  int? charges;
  int? discount;
  String? validTill;
  List<String>? images;

  GetServicesModel(
      {this.id,
      this.name,
      this.description,
      this.therapyName,
      this.serviceProviderId,
      this.serviceProviderName,
      this.charges,
      this.discount,
      this.validTill,
      this.images});

  GetServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    therapyName = json['therapyName'];
    serviceProviderId = json['serviceProviderId'];
    serviceProviderName = json['serviceProviderName'];
    charges = json['charges'];
    discount = json['discount'];
    validTill = json['validTill'];
    images = _getImages(json['images']);
  }

  List<String> _getImages(String image) {
    const String baseUrl = 'http://132.148.73.196:81/';
    var images = image.split(';').map((img) => '$baseUrl$img').toList();
    return images;
  }
}
