part of 'create_or_edit_customer_service_request_bloc.dart';

sealed class CreateOrEditCustomerServiceRequestEvent {
 }

class CreateCustomerServiceRequestEvent extends CreateOrEditCustomerServiceRequestEvent {
  final CreateOrUpdateCustomerServiceRequestModel model;

  CreateCustomerServiceRequestEvent({required this.model});
}

class UpdateCustomerServiceRequestEvent extends CreateOrEditCustomerServiceRequestEvent {
  final CreateOrUpdateCustomerServiceRequestModel model;

  UpdateCustomerServiceRequestEvent({required this.model});
}

class DeletePictureCustomerServiceRequestEvent extends CreateOrEditCustomerServiceRequestEvent {
  final DeleteCustomerRequestImageModel model;

  DeletePictureCustomerServiceRequestEvent({required this.model});
}

class DeleteCustomerServiceRequestEvent extends CreateOrEditCustomerServiceRequestEvent {
  final int id;

  DeleteCustomerServiceRequestEvent({required this.id});
}