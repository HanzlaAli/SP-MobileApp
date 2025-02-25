// ignore_for_file: unnecessary_null_comparison, file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import '../../../Data/Models/ChatModels/ChatModel.dart';
import '../../../Presentation/Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../Presentation/Bloc/SendMessageBloc/send_message_bloc.dart';
import '../../../Presentation/Bloc/ThemeBloc/theme_bloc.dart';
import '../../../Presentation/Controllers/ChatController.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MyIcons.dart';
import '../../../Data/Models/FireBaseUserModel/ChatHeadChatUserModel.dart';
import '../../../Data/Models/PushNotificationModel/MessagePuchNotificationModel.dart';
import '../../../Data/Models/PushNotificationModel/NotificationModel.dart'
    as notification;
import '../../Bloc/PushNotificationBloc/push_notification_bloc.dart';

class ChatScreen extends StatefulWidget {
  ChatHeadChatUserModel? model;

  ChatScreen({super.key, this.model});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatController controller = ChatController();
  final chatController = TextEditingController();

  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
    //  getChat(initialValue);
  }

  // void getChat(int val) {
  //   var chats = controller.getChat(
  //       otherUserId: widget.model!.reciverId,
  //       currentuserId: widget.model!.uId,
  //       length: initialValue);
  //   _controller.addStream(chats);
  // }

  int initialValue = 15;
  int nextVal = 0;
  var chatSheetHeight;
  int? totalValues;
  ChatModel? documentSnapshot;
  @override
  Widget build(BuildContext context) {
    if (WidgetsBinding.instance.window.viewInsets.bottom > 0.0) {
      chatSheetHeight = MediaQuery.of(context).size.height * 0.42;
    } else {
      chatSheetHeight = MediaQuery.of(context).size.height * 0.75;
    }
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor:
                state is DarkThemeState ? kBlackColor : kWhiteColor,
            appBar: _appBar(
                context,
                widget.model!.imageUrl.toString(),
                widget.model!.userName.toString(),
                widget.model?.isActive ?? false,
                widget.model!.lastActive ?? "",
                state),
            body: Stack(
              children: [
                chatList(),
                textField(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget chatList() => SizedBox(
        height: chatSheetHeight,
        child: StreamBuilder<List<ChatModel>>(
          stream: controller.getChat(
              otherUserId: widget.model!.reciverId,
              currentuserId: widget.model!.uId,
              length: nextVal == 0 ? initialValue : nextVal),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
            } else if (snapshot.hasData) {
              if (snapshot.data!.length != 0) {
                documentSnapshot =
                    snapshot.data!.length > 0 ? snapshot.data?.last : null;
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else if (snapshot.data! == null) {
              return Center(
                child: Text('Start Chat with ${widget.model!.userName}'),
              );
            }
            if (snapshot.data?.length == 0) {
              return EmptyDataScreen(text: 'No Chats!');
            } else {
              return NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;
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
                          color: kPrimaryColor,
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
            }
          },
        ),
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
                                color: kPrimaryColor,
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

  void sendNotification() {
    GetProfileLoaded? profileLoaded;
    GetProfileStateBase state = BlocProvider.of<GetProfileBloc>(context).state;
    if (state is GetProfileLoaded) {
      profileLoaded = state;
    }
    String name =
        ("${profileLoaded!.serviceProviderProfileModel!.user!.firstName} ${profileLoaded.serviceProviderProfileModel!.user!.lastName}");
    BlocProvider.of<PushNotificationBloc>(context).add(SendMessageNotification(
        model: MessagePushNotificationModel(
      data: Data(
        notificationType: 'message',
        reciverId: widget.model!.reciverId,
        senderId: widget.model!.uId,
        reciverName: widget.model!.userName,
        senderName: name,
        senderProfilePicture: profileLoaded.serviceProviderProfileModel!.profilePicture,
      ),
      notification: notification.Notification(
        body: chatController.text,
        title: name,
      ),
    )));
  }

  PreferredSizeWidget _appBar(BuildContext context, String image, String name,
          bool isActive, String lastActive, ThemeState theme) =>
      PreferredSize(
        preferredSize:
            kIsWeb ? const Size.fromHeight(75) : const Size.fromHeight(70),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(top: 16),
                        height: 100,
                        child: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: state is DarkThemeState
                              ? kWhiteColor
                              : kBlackColor,
                        )),
                  ),
                  SizedBox(
                    height: 200,
                    width: 300,
                    child: ListTile(
                      textColor:
                          state is DarkThemeState ? kBlackColor : kWhiteColor,
                      leading: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kBlueAccentColor),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(image),
                          onBackgroundImageError: (exception, stackTrace) =>
                              byDefaultImage,
                          radius: 18,
                          backgroundColor: kBlueAccentColor,
                        ),
                      ),
                      title: Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: state is DarkThemeState
                              ? kWhiteColor
                              : kBlackColor,
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
                ],
              ),
            );
          },
        ),
      );
}
