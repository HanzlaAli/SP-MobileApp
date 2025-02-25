// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart' show Bloc;
import '../../Controllers/SharedPrefrenceController.dart';
part 'app_opened_event.dart';
part 'app_opened_state.dart';

class AppOpenedBloc extends Bloc<AppOpenedEventBase, AppOpenedStateBase> {
  final _controller = SharedPrefrenceController();
  AppOpenedBloc() : super(AppOpenedInitialState()) {
    on<IsAppOpenedEvent>((event, emit) async {
      emit(AppOpenedLoadingState());
      bool? isOpened = await _controller.getIsAppOpened();
      if (isOpened ?? false) {
        emit(AppOpenedState());
      } else {
        await _controller.isAppOpenedSave(true);
        emit(AppNotOpenedState());
      }
    });
  }
}
