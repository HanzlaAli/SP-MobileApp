part of 'get_all_services_bloc.dart';

abstract class GetAllServicesStateBase {}

class GetAllServicesInitial extends GetAllServicesStateBase {}

class GetAllServicesLoading extends GetAllServicesStateBase {}

class GetAllServicesLoaded extends GetAllServicesStateBase {
  List<GetAllServiceModel>? model;
  List<GetAllServiceModel>? filteredList;
  String? val;
  GetAllServicesLoaded({this.model, this.val}) {
    if (val != null && val != "") {
      filteredList = model
          ?.where((x) =>
              x.serviceProviderName!.toLowerCase().contains(val!.toLowerCase()) ||
              x.name!.toLowerCase().contains(val!.toLowerCase()))
          .toList();
    }
  }
}

class GetAllServicesError extends GetAllServicesStateBase {}
