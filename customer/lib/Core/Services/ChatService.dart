import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../Data/Models/ChatModels/ActiveNotActiveUserModel.dart';
import '../../Data/Models/ChatModels/ChatModel.dart';
import '../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../Data/Models/FireBaseUserModel/ChatHeadChatUserModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/AppoinmentRepo.dart';
import '../Repo/FireBase/ChatRepo.dart';
import 'ServiceProviderService.dart';


class ChatService {
  final chatRepo = ChatRepo();
  final appoinmentRepo = AppoinmentRepo();

  Future<Either<ErrorModel, SuccessModel>> sendMessage(ChatModel model) async {
    int res = await chatRepo.save(null, 'Chat', model.toSnapShot());
    if (res == 200) {
      return right(SuccessModel(code: 200, message: 'Chat Sent!'));
    } else {
      return left(ErrorModel(code: 500, message: 'Chat Not Sent!'));
    }
  }

  Future<Either<ErrorModel, ChatModel>> getLastMessage(
      int senderId, int reciverId) async {
    QuerySnapshot snapshot = await chatRepo.get('Chat');
    ChatModel model =
        snapshot.docs.map((e) => ChatModel.fromSnapShot(e)).lastWhere(
              (x) =>
                  // ignore: unrelated_type_equality_checks
                  (x.reciverId == reciverId && x.senderId == senderId) ||
                  // ignore: unrelated_type_equality_checks
                  (x.reciverId == senderId && x.senderId == reciverId),
              orElse: () => ChatModel(),
            );
    if (model != null) {
      return right(model);
    } else {
      return left(ErrorModel(code: 500, message: 'Chat Not Sent!'));
    }
  }

  Future<Either<ErrorModel, SuccessModel>> createChatHead(
      CreateChatHeadModel model) async {
    int res = 0;
    //Get Chat Head of user
    Either<int, DocumentSnapshot> resp =
        await chatRepo.getDocument(model.uId, 'ChatHead');
    // For Customer
    resp.fold((l) => ErrorModel(), (r) {
      if (r.data() == null) {
        //if user array does not exists
        res = chatRepo.saveArray(model.uId, {"UserId": model.CustomerId});
      } else {
        //if user array  exists
        res = chatRepo.updateArray(model.uId, {"UserId": model.CustomerId});
      }
      return SuccessModel();
    });
    //For ServiceProvider
    Either<int, DocumentSnapshot> respo =
        await chatRepo.getDocument(model.CustomerId, 'ChatHead');
    respo.fold((l) => ErrorModel(), (r) {
      if (r.data() == null) {
        //if user array does not exists

        res = chatRepo.saveArray(model.CustomerId, {"UserId": model.uId});
      } else {
        //if user array exists
        res = chatRepo.updateArray(model.CustomerId, {"UserId": model.uId});
      }
      return SuccessModel();
    });
    if (res == 200) {
      return right(SuccessModel(code: 200, message: 'Chat Sent!'));
    } else {
      return left(ErrorModel(code: 500, message: 'Chat Not Sent!'));
    }
  }

  void readMessage(String messageId) {
    chatRepo.fireStore
        .collection('Chat')
        .doc(messageId)
        .set({'IsRead': true}, SetOptions(merge: true));
  }

  Stream<List<ChatModel>> getChat(
          {int? otherUserId, int? currentuserId, required int length}) =>
      chatRepo.getMessagesInRealTime(
          currentuserId: currentuserId,
          otherUserId: otherUserId,
          length: length);
  void changeActiveStatus(ActiveNotActiveUserModel model) {
    try {
      chatRepo.fireStore
          .collection('Users')
          .doc(model.userId)
          .update(model.toSnapshot());
    } catch (e) {}
  }

  Future<List<ChatHeadChatUserModel>> getChatHead({int? currentUserId}) async {
    ServiceProviderService docservice = ServiceProviderService();
    List<ChatHeadChatUserModel> list = [];
    List<GetCustomerAppoinmentsModel> appointmentlist = [];

    //Getting Chat Heads From firebase
    var model = await chatRepo.getChatHead(
      currentuserId: currentUserId,
    );
    //GET APPOINTMENTS OF THE Customer
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    //API CALL FOR APPOINTMENTS
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getCustomerBookedAppoinments,
        token: token,
        body: GetBookedAppoinmentRequestModel(
                fromDate: DateTime.now().toIso8601String(),
                toDate: DateTime.now().toIso8601String(),
                email: "")
            .toJson());
    //CHECKING RESPONSE
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      for (var items in res) {
        appointmentlist.add(GetCustomerAppoinmentsModel.fromJson(items));
      }
    }

    if (model.users!.length > 0) {
      for (var data in model.users!) {
        ChatHeadChatUserModel user = ChatHeadChatUserModel();
        // Getting ServiceProviders From Firestore
        var serviceProvider = await docservice.getServiceProvider(data.userId.toString());
        if (serviceProvider.isRight()) {
          //Get last message of the chat
          var lastMessage =
              await chatRepo.getLastMessage(model.userId!, data.userId!);
          //Assigning values to 'ChatHeadChatUserModel' object of last message
          lastMessage.fold((l) {}, (r) {
            user.messageUId = r.senderId;
            user.messageSnapShotId = r.snapshotId;
            user.lastMessage = r.messageBody;
            user.lastMessageTime = r.dateTime;
            user.timeSpam = r.timeSpan;
            user.isRead = r.isRead ?? true;
          });

          //Assigning values to 'ChatHeadChatUserModel' object of serviceProvider
          serviceProvider.fold((l) {}, (r) {
            user.userName = '${r.firstName} ${r.lastName}';
            user.lastActive = r.lastActive;
            user.isActive = r.isActive;
            user.imageUrl = r.imageUrl;
            user.uId = model.userId;
            user.reciverId = data.userId;
          });
          //MERGING APPOINTMENTS IN THE CHAT HEAD
          GetCustomerAppoinmentsModel appoinment = appointmentlist.firstWhere(
              (x) =>
                  x.serviceProviderName!.toLowerCase() == user.userName!.toLowerCase(),
              orElse: () => GetCustomerAppoinmentsModel());
          if (appoinment.startTime != null) {
            user.appointmentStartTime =
                DateTime.parse(appoinment.startTime.toString());
          }
          //Added List
          list.add(user);
        }
      }
    }
    //Sotring list according to Timespan
    list.sort((a, b) {
      if (a.appointmentStartTime == null || a.appointmentStartTime == "") {
        return 0;
      } else {
        return b.appointmentStartTime == null
            ? 0
            : a.appointmentStartTime!.compareTo(b.appointmentStartTime!);
      }
    });
    return list;
  }
}
