part of 'add_serviceProvider_therapy_bloc.dart';

abstract class AddServiceProviderTherapyStateBase {
  const AddServiceProviderTherapyStateBase();
}

class AddServiceProviderTherapyInitial extends AddServiceProviderTherapyStateBase {}

class AddServiceProviderTherapyLoading extends AddServiceProviderTherapyStateBase {}

class AddServiceProviderTherapySuccess extends AddServiceProviderTherapyStateBase {}

class AddServiceProviderTherapyError extends AddServiceProviderTherapyStateBase {}
