part of 'add_serviceProvider_therapy_bloc.dart';

abstract class AddServiceProviderTherapyEventBase {
  const AddServiceProviderTherapyEventBase();
}

class AddServiceProviderTherapyEvent extends AddServiceProviderTherapyEventBase {
  AddServiceProviderTherapyModel addServiceProviderTherapyModel;
  AddServiceProviderTherapyEvent({required this.addServiceProviderTherapyModel});
}
