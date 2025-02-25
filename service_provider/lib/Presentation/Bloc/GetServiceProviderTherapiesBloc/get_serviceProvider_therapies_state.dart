part of 'get_serviceProvider_therapies_bloc.dart';

abstract class GetServiceProviderTherapiesState {
  const GetServiceProviderTherapiesState();
}

class GetServiceProviderTherapiesInitial extends GetServiceProviderTherapiesState {}

class GetServiceProviderTherapiesLoading extends GetServiceProviderTherapiesState {}

class GetServiceProviderTherapiesLoaded extends GetServiceProviderTherapiesState {
  List<GetServiceProviderTherapyModel>? list;
  GetServiceProviderTherapiesLoaded({this.list});
}

class GetServiceProviderTherapiesError extends GetServiceProviderTherapiesState {
  ErrorModel? errorModel;
  GetServiceProviderTherapiesError({this.errorModel});
}
