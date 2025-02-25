import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppoinmentModels/GetAppoinmentTypeModel.dart';
import '../../../Presentation/Controllers/AppoinmentController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'get_appoinment_type_event.dart';
part 'get_appoinment_type_state.dart';

class GetAppoinmentTypeBloc
    extends Bloc<GetAppoinmentTypeEventBase, GetAppoinmentTypeStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appoinmentController = AppoinmentController();

  GetAppoinmentTypeBloc() : super(GetAppoinmentTypeInitial()) {
    on<GetAppoinmentTypes>((event, emit) async {
      emit(GetAppoinmentTypeLoading());
      String? token = await sharedPrefrenceController.getToken();
      if (token != null) {
        Either<ErrorModel, List<GetAppoinmentTypeModel>> res =
            await appoinmentController.getAppoinmentType(token);
        res.fold((l) => emit(GetAppoinmentTypeError()),
            (r) => emit(GetAppoinmentTypeLoaded(model: r)));
      }
    });
  }
}
