import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../Data/Models/AppoinmentModels/CreateAppoinmentModel.dart';
import '../../../Presentation/Controllers/ChatController.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';
import '../../../Data/Models/SharedModels/SuccessModel.dart';
import '../../Controllers/AppoinmentController.dart';
import '../../Controllers/SharedPrefrenceController.dart';
part 'create_appoinment_event.dart';
part 'create_appoinment_state.dart';

class CreateAppoinmentBloc
    extends Bloc<CreateAppoinmentEventBase, CreateAppoinmentStateBase> {
  final sharedPrefrenceController = SharedPrefrenceController();
  final appoinmentController = AppoinmentController();
  final chatController = ChatController();

  CreateAppoinmentBloc() : super(CreateAppoinmentInitial()) {
    on<CreateAppoinment>((event, emit) async {
      emit(CreateAppoinmentLoading());

      String? token = await sharedPrefrenceController
          .getToken();
      if (token != null) {
        Either<ErrorModel, SuccessModel> res =
            await appoinmentController.createAppoinment(event.model!, token);
        res.fold((l) => emit(CreateAppoinmentError()), (r) {
          // chatController.createChatHead(CreateChatHeadModel(
          //   uId: event.chatHeadModel!.uId,
          //   customerId: event.chatHeadModel!.customerId,
          // ));
          emit(CreateAppoinmentSuccess());
        });
      }
    });
  }
}
