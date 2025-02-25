import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/LicenseModels/GetLicenseTypeModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Presentation/Controllers/ServiceProviderLicenseController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_serviceProvider_license_types_event.dart';
part 'get_serviceProvider_license_types_state.dart';

class GetServiceProviderLicenseTypesBloc
    extends Bloc<GetServiceProviderLicenseTypesEventBase, GetServiceProviderLicenseTypesState> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _serviceProviderTherapyController = ServiceProviderLicenseController();
  GetServiceProviderLicenseTypesBloc() : super(GetServiceProviderLicenseTypesInitial()) {
    on<GetServiceProviderLicenseTypesEvent>((event, emit) async {
      emit(GetServiceProviderLicenseTypesLoading());
      String? token = await _sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, List<GetLicenseTypeModel>> res =
            await _serviceProviderTherapyController.getLicenseTypes(token: token);
        res.fold((l) => emit(GetServiceProviderLicenseTypesError(errorModel: l)),
            (r) => emit(GetServiceProviderLicenseTypesLoaded(getLicenseTypeModel: r)));
      }
    });
  }
}
