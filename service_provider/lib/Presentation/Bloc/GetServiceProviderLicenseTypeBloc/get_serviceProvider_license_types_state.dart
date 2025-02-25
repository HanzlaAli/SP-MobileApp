part of 'get_serviceProvider_license_types_bloc.dart';

abstract class GetServiceProviderLicenseTypesState {
  const GetServiceProviderLicenseTypesState();
}

class GetServiceProviderLicenseTypesInitial extends GetServiceProviderLicenseTypesState {}

class GetServiceProviderLicenseTypesLoading extends GetServiceProviderLicenseTypesState {}

class GetServiceProviderLicenseTypesLoaded extends GetServiceProviderLicenseTypesState {
  List<GetLicenseTypeModel> getLicenseTypeModel;
  GetServiceProviderLicenseTypesLoaded({required this.getLicenseTypeModel});
}

class GetServiceProviderLicenseTypesError extends GetServiceProviderLicenseTypesState {
  ErrorModel? errorModel;
  GetServiceProviderLicenseTypesError({this.errorModel});
}
