part of 'add_serviceProvider_license_bloc.dart';

abstract class AddServiceProviderLicenseEventBase {
  const AddServiceProviderLicenseEventBase();
}

class AddServiceProviderLicenseEvent extends AddServiceProviderLicenseEventBase {
  AddServiceProviderLicenseModel addServiceProviderLicenseModel;
  AddServiceProviderLicenseEvent({required this.addServiceProviderLicenseModel});
}

class UpdateServiceProviderLicenseEvent extends AddServiceProviderLicenseEventBase {
  int id;
  AddServiceProviderLicenseModel addServiceProviderLicenseModel;
  UpdateServiceProviderLicenseEvent(
      {required this.addServiceProviderLicenseModel, required this.id});
}
