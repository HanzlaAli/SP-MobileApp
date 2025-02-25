import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/TherapyModels/GetTherapyTypeModel.dart';
import '../../../Presentation/Controllers/ServiceProviderTherapyController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_therapy_types_event.dart';
part 'get_therapy_types_state.dart';

class GetTherapyTypesBloc
    extends Bloc<GetTherapyTypesEventBase, GetTherapyTypesBase> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _serviceProviderTherapyController = ServiceProviderTherapyController();
  GetTherapyTypesBloc() : super(GetTherapyTypesInitial()) {
    on<GetTherapyTypesEventBase>((event, emit) async {
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        Either<ErrorModel, List<GetTherapyTypeModel>> res =
            await _serviceProviderTherapyController.getTherapy(token: token);
        res.fold((l) => emit(GetTherapyTypesError(errorModel: l)),
            (r) => emit(GetTherapyTypesLoaded(getTherapyTypeModel: r)));
      }
    });
  }
}
