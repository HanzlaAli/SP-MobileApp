import 'package:bloc/bloc.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEventBase, LogOutStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  LogOutBloc() : super(LogOutInitial()) {
    on<LogOutEvent>((event, emit) {
      sharedPrefrenceController.deleteAllData();
      emit(LogOutSuccess());
    });
  }
}
