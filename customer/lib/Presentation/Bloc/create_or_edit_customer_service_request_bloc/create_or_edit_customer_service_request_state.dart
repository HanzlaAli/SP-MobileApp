part of 'create_or_edit_customer_service_request_bloc.dart';

sealed class CreateOrEditCustomerServiceRequestState {}

class CreateOrEditCustomerServiceRequestInitial
    extends CreateOrEditCustomerServiceRequestState {}

class CreateOrEditCustomerServiceRequestLoading
    extends CreateOrEditCustomerServiceRequestState {}

final class CreateOrEditCustomerServiceRequestSuccess
    extends CreateOrEditCustomerServiceRequestState {
      SuccessModel model;
      CreateOrEditCustomerServiceRequestSuccess({required this.model});
    }

final class CreateOrEditCustomerServiceRequestError
    extends CreateOrEditCustomerServiceRequestState {
      ErrorModel model;
      CreateOrEditCustomerServiceRequestError({required this.model});
    }
