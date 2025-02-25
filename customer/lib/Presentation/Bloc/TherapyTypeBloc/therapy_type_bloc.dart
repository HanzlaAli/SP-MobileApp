// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart' show Bloc;
import '../../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../../Presentation/Controllers/TherapyTypeController.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
part 'therapy_type_event.dart';
part 'therapy_type_state.dart';

class TherapyTypeBloc extends Bloc<TherapyTypeEventBase, TherapyTypeStateBase> {
  final _sharedPrefrenceController = SharedPrefrenceController();
  final _therapyType = TherapyTypeController();
  TherapyTypeBloc() : super(TherapyTypeInitialState()) {
    on<GetTherapyType>((event, emit) async {
      String? token;
      try {
        token = await _sharedPrefrenceController.getToken();

        if (token != null) {
          var res = await _therapyType.getTherapyType(token);
          res.fold((l) => emit((TherapyTypeErrorState())),
              (r) => emit(TherapyTypeLoadedState(model: r)));
        } else {
          emit(TherapyTypeErrorState());
        }
      } catch (e) {
        emit(TherapyTypeErrorState());
      }
    });
  }
}
