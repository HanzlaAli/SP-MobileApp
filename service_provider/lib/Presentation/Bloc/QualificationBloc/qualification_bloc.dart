import 'package:bloc/bloc.dart';
import '../../../Data/Models/QualificationModels/CreateQualificationModel.dart';
import '../../../Data/Models/QualificationModels/UpdateQualification.dart';
import '../../Controllers/QualificationController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'qualification_event.dart';
part 'qualification_state.dart';

class QualificationBloc extends Bloc<QualificationEvent, QualificationState> {
  final qualificationController = QualificationController();
  final _sharedPrefrenceController = SharedPrefrenceController();
  QualificationBloc() : super(QualificationInitial()) {
    on<AddQualification>((event, emit) async {
      emit(QualificationLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var result =
            await qualificationController.addQualification(event.model!, token);
        result.fold((l) => emit(QualificationError()),
            (r) => emit(QualificationLoaded()));
      }
    });

    on<UpdateQualification>((event, emit) async {
      emit(QualificationLoading());
      String? token = await _sharedPrefrenceController.getToken();

      if (token != null) {
        var result = await qualificationController.updateQualification(
            event.model!, token);
        result.fold((l) => emit(QualificationError()),
            (r) => emit(QualificationLoaded()));
      }
    });
  }
}
