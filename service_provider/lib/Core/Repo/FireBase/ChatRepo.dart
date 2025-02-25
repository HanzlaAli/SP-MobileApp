import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../Core/Repo/FireBase/Base/FireBaseRepoBase.dart';
import '../../../Data/Models/ChatModels/ChatModel.dart';
import '../../../Data/Models/ChatModels/ChatHeadModel.dart';
import '../../../Data/Models/SharedModels/ErrorModel.dart';

class ChatRepo extends FireBaseRepoBase {
  int saveArray(uId, var model) {
    try {
      fireStore.collection('ChatHead').doc(uId.toString()).set({
        "UserId": uId.toString(),
        "Users": [model]
      });
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<ChatHeadModel> getChatHead({int? currentuserId}) async {
    // ignore: close_sinks
    DocumentSnapshot messageQuerySnapshot = await fireStore
        .collection('ChatHead')
        .doc('$currentuserId')
        //  .where('UserId', isEqualTo: currentuserId)
        .get();
    var messages = ChatHeadModel.fromJson(messageQuerySnapshot);

    return messages;
  }

  int updateArray(uId, var model) {
    try {
      fireStore.collection('ChatHead').doc(uId.toString()).update({
        "Users": FieldValue.arrayUnion([model])
      });
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<Either<ErrorModel, ChatModel>> getLastMessage(
      int senderId, int reciverId) async {
    // ignore: close_sinks
    QuerySnapshot messageQuerySnapshot = await fireStore
        .collection('Chat')
        .orderBy('TimeSpan', descending: false)

        //  .where('UserId', isEqualTo: currentuserId)
        .get();
    ChatModel lastMessage = messageQuerySnapshot.docs
        .map((e) => ChatModel.fromSnapShot(e))
        .lastWhere(
          (x) =>
              // ignore: unrelated_type_equality_checks
              (x.reciverId == reciverId && x.senderId == senderId) ||
              // ignore: unrelated_type_equality_checks
              (x.reciverId == senderId && x.senderId == reciverId),
          orElse: () => ChatModel(),
        );

    return right(lastMessage);
  }

  Stream<List<ChatModel>> getMessagesInRealTime(
      {int? otherUserId, int? currentuserId, required int length}) {
    // ignore: close_sinks
    final StreamController<List<ChatModel>> _chatMessages =
        StreamController<List<ChatModel>>.broadcast();
    Query<Map<String, dynamic>> messageQuerySnapshot = fireStore
        .collection('Chat')
        .orderBy('TimeSpan', descending: true)
        .limit(length);

    messageQuerySnapshot.snapshots().listen((messageEvent) {
      if (messageEvent.docs.isNotEmpty) {
        var messages = messageEvent.docs
            .map((item) => ChatModel.fromSnapShot(item))
            .where((element) =>
                (element.reciverId == otherUserId &&
                    element.senderId == currentuserId) ||
                (element.reciverId == currentuserId &&
                    element.senderId == otherUserId))
            .toList();

        _chatMessages.add(messages);
      }
    });
    return _chatMessages.stream;
  }

  Query chatHeadWithPagination({String? currentUserId}) {
    Query<Map<String, dynamic>> messageQuerySnapshot = fireStore
        .collection('ChatHead')
        .where('UserId', isEqualTo: currentUserId);
    return messageQuerySnapshot;
  }
}
