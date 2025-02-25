import 'package:bloc/bloc.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'remember_me_event.dart';
part 'remember_me_state.dart';

class RememberMeBloc extends Bloc<RememberMeEvent, RememberMeState> {
  final sharedPrefrenceController = SharedPrefrenceController();
  RememberMeBloc() : super(RememberMeInitial()) {
    on<RememberMe>((event, emit) {
      sharedPrefrenceController.rememberMeSave(event.email!, event.password!);
      emit(RememberMeLoaded(email: event.email, password: event.password));
    });
    on<GetRememberMe>((event, emit) async {
      var rememberMe = await sharedPrefrenceController.getRememberMe();
      if (rememberMe['email'] != null && rememberMe['password'] != null) {
        emit(RememberMeLoaded(
            email: rememberMe['email'], password: rememberMe['password']));
      } else {
        emit(RememberMeError());
      }
    });
  }
}
