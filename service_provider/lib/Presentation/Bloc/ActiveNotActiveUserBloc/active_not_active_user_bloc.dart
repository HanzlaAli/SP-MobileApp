import 'package:bloc/bloc.dart';
import '../../../Presentation/Controllers/ChatController.dart';
import '../../../Data/Models/ChatModels/ActiveNotActiveUserModel.dart';
import '../../../Presentation/Controllers/SharedPrefrenceController.dart';
part 'active_not_active_user_event.dart';
part 'active_not_active_user_state.dart';

class ActiveNotActiveUserBloc
    extends Bloc<ActiveNotActiveUserEvent, ActiveNotActiveUserState> {
  ActiveNotActiveUserBloc() : super(ActiveNotActiveUserInitial()) {
    ChatController controller = ChatController();
    SharedPrefrenceController sharedPrefrenceController =
        SharedPrefrenceController();
    on<UserActive>((event, emit) async {
      int? userId = await sharedPrefrenceController.getUserId();
      if (userId != null) {
        var model =
            ActiveNotActiveUserModel(isActive: true, userId: userId.toString());
        controller.changeActiveStatus(model);
      }
    });
    on<UserNonActive>((event, emit) async {
      int? userId = await sharedPrefrenceController.getUserId();
      if (userId != null) {
        var model = ActiveNotActiveUserModel(
            isActive: false, userId: userId.toString());
        controller.changeActiveStatus(model);
      }
    });
  }
}
