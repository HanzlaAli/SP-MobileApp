import '../../../Data/service_type/service_type_model.dart';

sealed class ServiceTypeState {}

class ServiceTypeInitialState extends ServiceTypeState {}

class ServiceTypeLoadingState extends ServiceTypeState {}

class ServiceTypeLoadedState extends ServiceTypeState {
  List<ServiceTypeModel>? model;
  ServiceTypeLoadedState({this.model});
}

class ServiceTypeErrorState extends ServiceTypeState {}
