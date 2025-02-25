part of 'get_all_services_bloc.dart';

abstract class GetAllServicesEventBase {}

class GetAllServices extends GetAllServicesEventBase {}

class GetFilteredServices extends GetAllServicesEventBase {
  FilterServiceRequestModel? model;
  GetFilteredServices({
    this.model,
  });
}

class SearchService extends GetAllServicesEventBase {
  String? val;
  List<GetAllServiceModel>? model;
  SearchService({
    this.val,
    this.model,
  });
}
