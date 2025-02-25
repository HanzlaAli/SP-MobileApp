part of 'get_serviceProvider_specialization_bloc.dart';

abstract class GetServiceProviderSpecializationStateBase {
  const GetServiceProviderSpecializationStateBase();
}

class GetServiceProviderSpecializationInitial extends GetServiceProviderSpecializationStateBase {}

class GetServiceProviderSpecializationLoading extends GetServiceProviderSpecializationStateBase {}

class GetServiceProviderSpecializationLoaded extends GetServiceProviderSpecializationStateBase {
  List<GetSpecializationModel> getSpecializationModel;
  GetServiceProviderSpecializationLoaded({required this.getSpecializationModel});
}

class GetServiceProviderSpecializationError extends GetServiceProviderSpecializationStateBase {
  ErrorModel? errorModel;
  GetServiceProviderSpecializationError({this.errorModel});
}
