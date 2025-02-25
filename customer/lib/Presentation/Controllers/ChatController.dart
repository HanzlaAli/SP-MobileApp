import 'package:dartz/dartz.dart';
import '../../Core/Services/ChatService.dart';
import '../../Data/Models/ChatModels/ActiveNotActiveUserModel.dart';
import '../../Data/Models/ChatModels/ChatModel.dart';
import '../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';

class ChatController {
  ChatService service = ChatService();
  Future<Either<ErrorModel, SuccessModel>> sendMessage(ChatModel model) async =>
      service.sendMessage(model);

  void readMessage(String messageId) => service.readMessage(messageId);

  Future<Either<ErrorModel, SuccessModel>> createChatHead(
          CreateChatHeadModel model) async =>
      service.createChatHead(model);
  Stream<List<ChatModel>> getChat(
          {int? otherUserId, int? currentuserId, required int length}) =>
      service.getChat(
          currentuserId: currentuserId,
          otherUserId: otherUserId,
          length: length);
  void changeActiveStatus(ActiveNotActiveUserModel model) =>
      service.changeActiveStatus(model);
}
