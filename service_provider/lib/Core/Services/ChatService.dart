import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../Core/Repo/FireBase/ChatRepo.dart';
import '../../Data/Models/ChatModels/ActiveNotActiveUserModel.dart';
import '../../Core/Services/ServiceProviderService.dart';
import '../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../Data/Models/FireBaseUserModel/ChatHeadChatUserModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Data/Models/AppoinmentModels/GetServiceProviderAppoinmentsModel.dart';
import '../../Data/Models/ChatModels/ChatModel.dart';
import '../../Data/Models/SharedModels/ErrorModel.dart';
import '../../Data/Models/SharedModels/SuccessModel.dart';
import '../Repo/Api/AppoinmentRepo.dart';

class ChatService {
  final chatRepo = ChatRepo();
  AppoinmentRepo appoinmentRepo = AppoinmentRepo();
  Future<Either<ErrorModel, SuccessModel>> sendMessage(ChatModel model) async {
    int res = await chatRepo.save(null, 'Chat', model.toSnapShot());
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

  Future<Either<ErrorModel, SuccessModel>> createChatHead(
      CreateChatHeadModel model) async {
    int res = 0;
    Either<int, DocumentSnapshot> resp =
        await chatRepo.getDocument(model.uId, 'ChatHead');
    resp.fold((l) => ErrorModel(), (r) {
      if (r.data() == null) {
        res = chatRepo.saveArray(model.uId, {"UserId": model.customerId});
      } else {
        //   List<int> list = r.get('Users');
        //  if (!list.contains(model.customerId)) {
        res = chatRepo.updateArray(model.uId, {"UserId": model.customerId});
        //  }
      }
      return SuccessModel();
    });
    Either<int, DocumentSnapshot> respo =
        await chatRepo.getDocument(model.customerId, 'ChatHead');
    respo.fold((l) => ErrorModel(), (r) {
      if (r.data() == null) {
        res = chatRepo.saveArray(model.customerId, {"UserId": model.uId});
      } else {
        //  List<int> list = r.get('Users');
        // if (!list.contains(model.uId)) {
        res = chatRepo.updateArray(model.customerId, {"UserId": model.uId});
        //   }
      }
      return SuccessModel();
    });
    if (res == 200) {
      return right(SuccessModel(code: 200, message: 'Chat Sent!'));
    } else {
      return left(ErrorModel(code: 500, message: 'Chat Not Sent!'));
    }
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
    var model = await chatRepo.getChatHead(
      currentuserId: currentUserId,
    );
    ServiceProviderService docservice = ServiceProviderService();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<GetServiceProviderAppoinmentsModel> appointmentlist = [];

    String? token = prefs.getString('token');
    Response response = await appoinmentRepo.post(
        url: appoinmentRepo.getServiceProviderBookedAppoinments,
        token: token,
        body: GetBookedAppoinmentRequestModel(
                fromDate: DateTime.now().toIso8601String(),
                toDate: DateTime.now().toIso8601String(),
                email: "")
            .toJson());
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      for (var items in res) {
        appointmentlist.add(GetServiceProviderAppoinmentsModel.fromJson(items));
      }
    }
    List<ChatHeadChatUserModel> list = [];
    if (model.users != null && model.users!.isNotEmpty) {
      for (var data in model.users!) {
        ChatHeadChatUserModel user = ChatHeadChatUserModel();
        var serviceProvider = await docservice.getServiceProvider(data.userId.toString());
        var lastMessage =
            await chatRepo.getLastMessage(model.userId!, data.userId!);
        lastMessage.fold((l) {}, (r) {
          user.messageSnapShotId = r.snapshotId;
          user.messageUId = r.senderId;
          user.lastMessage = r.messageBody;
          user.lastMessageTime = r.dateTime;
          user.timeSpam = r.timeSpan;
          user.isRead = r.isRead ?? true;
        });
        serviceProvider.fold((l) {}, (r) {
          user.userName = '${r.firstName} ${r.lastName}';
          user.imageUrl = r.imageUrl;
          user.uId = model.userId;
          user.reciverId = data.userId;
        });
        //MERGING APPOINTMENTS IN THE CHAT HEAD

        GetServiceProviderAppoinmentsModel appoinment = appointmentlist.firstWhere(
            (x) => x.customerName!.toLowerCase() == user.userName!.toLowerCase(),
            orElse: () => GetServiceProviderAppoinmentsModel());
        if (appoinment.startTime != null) {
          user.appointmentStartTime =
              DateTime.parse(appoinment.startTime.toString());
        }
        list.add(user);
      }
    }
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

  //     Future<List<ChatHeadChatUserModel>> filter(DocumentSnapshot snapshot) async {
  //   ServiceProviderService docservice = ServiceProviderService();
  //   ChatHeadModel model = ChatHeadModel.fromJson(snapshot);
  //   List<ChatHeadChatUserModel> list = [];
  //   if (model.users!.isNotEmpty) {
  //     for (var data in model.users!) {
  //       ChatHeadChatUserModel user = ChatHeadChatUserModel();

  //       var serviceProvider = await docservice.getServiceProvider(data.userId.toString());
  //       var lastMessage =
  //           await service.getLastMessage(model.userId!, data.userId!);
  //       lastMessage.fold((l) {}, (r) {
  //         user.messageUId = r.senderId;
  //         user.lastMessage = r.messageBody;
  //         user.lastMessageTime = r.dateTime;
  //         user.timeSpam = r.timeSpan;
  //         user.isRead = r.isRead ?? true;
  //       });
  //       serviceProvider.fold((l) {}, (r) {
  //         user.userName = '${r.firstName} ${r.lastName}';
  //         user.imageUrl = r.imageUrl;
  //         user.uId = model.userId;
  //         user.reciverId = data.userId;
  //       });

  //       list.add(user);
  //     }
  //   }
  //   list.sort((a, b) => a.timeSpam!.compareTo(b.timeSpam!));
  //   return list;
  // }
  //   ServiceProviderService docservice = ServiceProviderService();
  //   List<ChatHeadChatUserModel> list = [];
  //   if (model.users!.length > 0) {
  //     for (var data in model.users!) {
  //       ChatHeadChatUserModel user = ChatHeadChatUserModel();
  //       var serviceProvider = await docservice.getServiceProvider(data.userId.toString());
  //       var lastMessage =
  //           await chatRepo.getLastMessage(model.userId!, data.userId!);
  //       lastMessage.fold((l) {}, (r) {
  //         user.messageUId = r.senderId;
  //         user.lastMessage = r.messageBody;
  //         user.lastMessageTime = r.dateTime;
  //         user.timeSpam = r.timeSpan;
  //         user.isRead = r.isRead ?? true;
  //       });
  //       serviceProvider.fold((l) {}, (r) {
  //         user.userName = '${r.firstName} ${r.lastName}';
  //         user.imageUrl = r.imageUrl;
  //         user.uId = model.userId;
  //         user.reciverId = data.userId;
  //       });

  //       list.add(user);
  //     }
  //   }
  //   list.sort((a, b) => a.timeSpam!.compareTo(b.timeSpam!));
  //   return list;
  // }
}
