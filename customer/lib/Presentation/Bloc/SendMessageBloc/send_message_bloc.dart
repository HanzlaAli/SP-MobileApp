import 'package:bloc/bloc.dart';
import '../../../Data/Models/ChatModels/ChatModel.dart';
import '../../Controllers/ChatController.dart';
part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  ChatController chatController = ChatController();
  SendMessageBloc() : super(SendMessageInitial()) {
    on<SendMessage>((event, emit) {
      chatController.sendMessage(event.model!);
    });
  }
}
