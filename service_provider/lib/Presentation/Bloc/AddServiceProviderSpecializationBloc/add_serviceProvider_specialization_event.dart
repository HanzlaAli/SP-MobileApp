part of 'add_serviceProvider_specialization_bloc.dart';

abstract class AddServiceProviderSpecializationEventBase {
  const AddServiceProviderSpecializationEventBase();
}

class AddServiceProviderSpecializationEvent extends AddServiceProviderSpecializationEventBase {
  AddServiceProviderSpecializationModel serviceProviderSpecializationModel;
  AddServiceProviderSpecializationEvent({required this.serviceProviderSpecializationModel});
}
