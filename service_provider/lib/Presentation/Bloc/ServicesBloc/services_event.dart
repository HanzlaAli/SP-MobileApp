part of 'services_bloc.dart';

abstract class ServicesEventBase {}

class AddNewService extends ServicesEventBase {
  AddServicesModel? model;
  AddNewService({this.model});
}

class GetAllService extends ServicesEventBase {}

class DeleteService extends ServicesEventBase {
  DeleteServiceModel? model;
  DeleteService({this.model});
}

class UpdateService extends ServicesEventBase {
  UpdateServiceModel? model;
  UpdateService({this.model});
}
