// ignore_for_file: unrelated_type_equality_checks, constant_identifier_names
import 'package:bloc/bloc.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  SharedPrefrenceController controller = SharedPrefrenceController();
  ThemeBloc() : super(ThemeInitial()) {
    on<DarkTheme>((event, emit) {
      controller.saveTheme(Theme.Dark);
      emit(DarkThemeState());
    });
    on<LightTheme>((event, emit) {
      controller.saveTheme(Theme.Light);
      emit(LightThemeState());
    });

    on<GetTheme>((event, emit) async {
      int? val = await controller.getTheme();
      if (val == null) {
        emit(LightThemeState());
      }
      if (val == Theme.Dark.name) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    });
  }
}

enum Theme {
  Light,
  Dark,
}
