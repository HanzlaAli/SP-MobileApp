import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Data/Models/PushNotificationModel/NotificationModel.dart'
    as notification;
import '../../../Presentation/Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../../../Presentation/Bloc/PushNotificationBloc/push_notification_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../helper/Constants.dart';
import '../../../Data/Models/ChatModels/ChatModel.dart';
import '../../../Data/Models/FireBaseUserModel/ChatHeadChatUserModel.dart';
import '../../../Data/Models/PushNotificationModel/MessagePuchNotificationModel.dart';
import '../../Bloc/SendMessageBloc/send_message_bloc.dart';
import '../../Controllers/ChatController.dart';

class ChatScreen extends StatefulWidget {
  ChatHeadChatUserModel? model;
  ChatScreen({super.key, this.model});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController controller = ChatController();
  final chatController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool isEmpty = false;

  int initialValue = 15;
  int nextVal = 0;
  var chatSheetHeight;
  int? totalValues;
  ChatModel? documentSnapshot;

  @override
  Widget build(BuildContext context) {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      chatSheetHeight = MediaQuery.of(context).size.height * 0.5;
    } else {
      chatSheetHeight = MediaQuery.of(context).size.height * 0.78;
    }
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(
            context,
            widget.model!.imageUrl.toString(),
            widget.model!.userName.toString(),
            widget.model?.isActive ?? false,
            widget.model!.lastActive ?? ""),
        body: Stack(
          children: [
            chatList(),
            textField(),
          ],
        ),
      ),
    );
  }

  Widget chatList() => Container(
        margin: EdgeInsets.only(bottom: 70),
        height: chatSheetHeight,
        child: StreamBuilder<List<ChatModel>>(
            stream: controller.getChat(
                otherUserId: widget.model!.reciverId,
                currentuserId: widget.model!.uId,
                length: nextVal == 0 ? initialValue : nextVal),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
              } else if (snapshot.hasData) {
                documentSnapshot =
                    snapshot.data!.length > 0 ? snapshot.data?.last : null;
              } else if (snapshot.hasError) {
                return const Center(
                  child: InternalServerErrorScreen(),
                );
              } else if (snapshot.data! == null) {
                return Center(
                  child: EmptyDataScreen(text: 'No Chats!'),
                );
              }
              return NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
                  print(snapshot.data!.last.snapshotId);
                  bool isTrue = totalValues == snapshot.data!.length &&
                      documentSnapshot!.snapshotId ==
                          snapshot.data!.last.snapshotId;
                  // documentSnapshot!.messageBody =
                  //     snapshot.data!.last.messageBody &&

                  if (isTrue) {
                  } else {
                    if (metrics.atEdge) {
                      bool isTop = metrics.pixels == 0;
                      if (!isTop) {
                        if (nextVal == 0) {
                          nextVal = initialValue;
                        }
                        setState(() {
                          nextVal += 10;
                        });
                      } else {}
                      totalValues = snapshot.data!.length;
                    }
                  }
                  return true;
                },
                child: ListView.builder(
                  //  controller: scrollController,
                  reverse: true,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: ((context, index) {
                    List<ChatModel> list = [];
                    list.addAll(snapshot.data!);
                    if (list[index].senderId == widget.model!.uId) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BubbleSpecialThree(
                          text: ' ${list[index].messageBody.toString()}',
                          color: const Color.fromARGB(255, 217, 232, 244),
                          tail: true,
                          textStyle:
                              const TextStyle(color: kBlackColor, fontSize: 16),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BubbleSpecialThree(
                          text: ' ${list[index].messageBody.toString()}',
                          color: kBlueAccentColor,
                          tail: true,
                          isSender: false,
                          textStyle:
                              const TextStyle(color: kWhiteColor, fontSize: 16),
                        ),
                      );
                    }
                  }),
                ),
              );
            }),
      );
  Widget textField() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
          color: kWhiteColor,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: TextFormField(
                  controller: chatController,
                  onChanged: (value) {
                    if (value == "" || value == null) {
                      setState(() {
                        isEmpty = false;
                      });
                    } else {
                      setState(() {
                        isEmpty = true;
                      });
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return "";
                    }
                    return null;
                  },
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'SFProText',
                    color: kBlackColor,
                  ),
                  cursorColor: kBlackColor,
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        sendMessage();
                        sendNotification();
                        chatController.clear();
                      },
                      child: SizedBox(
                        width: kIsWeb
                            ? 50
                            : MediaQuery.of(context).size.width * 0.11,
                        height: 30,
                        child: isEmpty == false
                            ? null
                            : const Icon(
                                Icons.send,
                                color: kBlueAccentColor,
                                size: 24,
                              ),
                      ),
                    ),
                    hintText: 'Message..',
                    hintStyle: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'SFProText',
                      color: kBlackColor38,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void sendNotification() {
    GetUserProfileLoaded? profileLoaded;
    GetUserProfileStateBase state =
        BlocProvider.of<GetUserProfileBloc>(context).state;
    if (state is GetUserProfileLoaded) {
      profileLoaded = state;
    }
    String name =
        ("${profileLoaded!.customerProfileModel!.user!.firstName} ${profileLoaded.customerProfileModel!.user!.lastName}");
    BlocProvider.of<PushNotificationBloc>(context).add(SendMessageNotification(
        model: MessagePushNotificationModel(
      data: Data(
        notificationType: 'message',
        reciverId: widget.model!.reciverId,
        senderId: widget.model!.uId,
        reciverName: widget.model!.userName,
        senderName: name,
        senderProfilePicture: profileLoaded.customerProfileModel!.profilePicture,
      ),
      notification: notification.Notification(
        body: chatController.text,
        title: name,
      ),
    )));
  }

  void sendMessage() {
    BlocProvider.of<SendMessageBloc>(context).add(SendMessage(
        model: ChatModel(
            dateTime: DateTime.now().toIso8601String(),
            isRead: false,
            messageBody: chatController.text,
            reciverId: widget.model!.reciverId,
            senderId: widget.model!.uId,
            timeSpan: DateTime.now().millisecondsSinceEpoch,
            uId: widget.model!.uId)));
  }

  PreferredSizeWidget _appBar(BuildContext context, String image, String name,
          bool isActive, String lastActive) =>
      PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  height: 100,
                  child: const Icon(Icons.arrow_back_ios_sharp)),
            ),
            SizedBox(
              height: 100,
              width: 300,
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kBlackColor45),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    onBackgroundImageError: (exception, stackTrace) =>
                        byDefaultImage,
                    radius: 18,
                    backgroundColor: kBlackColor45,
                  ),
                ),

                // Container(
                //   padding: const EdgeInsets.all(2),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50),
                //       color: kBlueAccentColor),
                //   child: CircleAvatar(
                //       backgroundColor: kBlueAccentColor,
                //       child: Image(
                //         errorBuilder: (BuildContext context, Object exception,
                //             StackTrace? stackTrace) {
                //           return byDefaultImage;
                //         },
                //         image: NetworkImage(widget.model!.imageUrl!),
                //         fit: BoxFit.cover,
                //         height: 30,
                //         width: 30,
                //       )),
                // ),

                title: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // subtitle: isActive == true
                //     ? const Text('Online')
                //     : const Text('Offline')
                // Text(
                //     dateTimetoTimeConverter(DateTime.parse(lastActive)),
                //   ),
              ),
            )
          ]),
        ),
      );
}
