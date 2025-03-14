part of 'services_bloc.dart';

abstract class ServicesEventBase {}

class CreateOrUpdateServiceEvent extends ServicesEventBase {
  CreateOrEditServiceModel? model;
  CreateOrUpdateServiceEvent({this.model});
}

class GetAllService extends ServicesEventBase {}

class DeleteService extends ServicesEventBase {
  DeleteServiceModel? model;
  DeleteService({this.model});
}

class DeleteServiceImage extends ServicesEventBase {
  DeleteServiceImageModel? model;
  DeleteServiceImage({this.model});
}
