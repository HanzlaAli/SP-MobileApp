import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/LicenseModels/AddServiceProviderLicense.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/ServiceProviderLicenseController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'add_serviceProvider_license_event.dart';
part 'add_serviceProvider_license_state.dart';

class AddServiceProviderLicenseBloc
    extends Bloc<AddServiceProviderLicenseEventBase, AddServiceProviderLicenseStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final serviceProviderLicenseController = ServiceProviderLicenseController();

  AddServiceProviderLicenseBloc() : super(AddServiceProviderLicenseInitial()) {
    on<AddServiceProviderLicenseEvent>((event, emit) async {
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await serviceProviderLicenseController
            .addServiceProviderLicense(token: token, model: event.addServiceProviderLicenseModel);
        res.fold((l) => emit(AddServiceProviderLicenseError()),
            (r) => emit(AddServiceProviderLicenseSuccess()));
      }
    });
    on<UpdateServiceProviderLicenseEvent>((event, emit) async {
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, SuccessModel> res = await serviceProviderLicenseController
            .updateServiceProviderLicense(event.id, event.addServiceProviderLicenseModel, token);
        res.fold((l) => emit(AddServiceProviderLicenseError()),
            (r) => emit(AddServiceProviderLicenseSuccess()));
      }
    });
  }
}
