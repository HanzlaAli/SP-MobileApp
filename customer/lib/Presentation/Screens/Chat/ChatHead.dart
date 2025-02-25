import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Presentation/Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Core/Services/ChatService.dart';
import '../../helper/Constants.dart';
import '../../helper/ReusedFunctions.dart';
import '../../../Data/Models/FireBaseUserModel/ChatHeadChatUserModel.dart';
import '../../Controllers/ChatController.dart';
import '../../Widgets/MyTextField.dart';
import 'Chat.dart';

class ChatHeadScreen extends StatefulWidget {
  const ChatHeadScreen({super.key});

  @override
  State<ChatHeadScreen> createState() => _ChatHeadScreenState();
}

class _ChatHeadScreenState extends State<ChatHeadScreen> {
  ChatService? service;
  GetUserProfileLoaded? getUserProfileLoaded;
  @override
  void initState() {
    service = ChatService();

    var state = BlocProvider.of<GetUserProfileBloc>(context).state;
    if (state is GetUserProfileLoaded) {
      getUserProfileLoaded = state;
    }
    super.initState();
  }

  List<ChatHeadChatUserModel>? filteredList;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: RefreshIndicator(
        onRefresh: () async {
          service!.getChatHead(
              currentUserId: getUserProfileLoaded?.customerProfileModel?.id);
        },
        child: FutureBuilder<List<ChatHeadChatUserModel>>(
          future: service!.getChatHead(
              currentUserId:
                  getUserProfileLoaded?.customerProfileModel?.user?.id),
          builder: (context, snapshot) {
            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return _shimmer(context);
            // } else
            if (snapshot.hasData) {
              if (snapshot.data!.length == 0) {
                return Center(
                  child: EmptyDataScreen(text: 'No Chats!'),
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: InternalServerErrorScreen(),
              );
            }
            return Column(
              children: [
                _filter(snapshot.data),
                Expanded(
                  child: ListView.builder(
                    //   separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        filteredList?.length ?? snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 72,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Column(
                          children: [
                            MyListTile(
                              model:
                                  filteredList?[index] ?? snapshot.data![index],
                              senderId: filteredList?[index].messageUId ??
                                  snapshot.data?[index].messageUId ??
                                  null,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _filter(List<ChatHeadChatUserModel>? model) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MyTextField(
          width: MediaQuery.of(context).size.width,
          icon: Icons.search,
          onFieldSubmitted: (val) {},
          onChanged: (val) {
            setState(() {
              filteredList = model!
                  .where(
                    (x) =>
                        x.userName!.toLowerCase().contains(
                              val.toLowerCase(),
                            ) ||
                        x.lastMessage!.toLowerCase().contains(
                              val.toLowerCase(),
                            ),
                  )
                  .toList();
            });
          },
          textEditingController: searchController,
          hintText: 'Search',
          validator: (val) {
            if (val!.isEmpty) {
              return "";
            } else {
              return null;
            }
          }),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) => AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_sharp)),
        title: const Text(
          'Chat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      );
}

class MyListTile extends StatelessWidget {
  ChatHeadChatUserModel model;
  int? senderId;
  MyListTile({
    Key? key,
    required this.model,
    this.senderId,
  }) : super(key: key);
  ChatController chatController = ChatController();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (model.uId != senderId && senderId != null && model.uId != null) {
          chatController.readMessage(model.messageSnapShotId!);
        }
        navigatorPush(
            context,
            ChatScreen(
              model: model,
            ));
      },
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: kBlueAccentColor),
        child: CircleAvatar(
          backgroundImage: NetworkImage(model.imageUrl ?? ""),
          onBackgroundImageError: (exception, stackTrace) =>
              const CircleAvatar(child: byDefaultImage),
          radius: 25,
          backgroundColor: kBlueAccentColor,
        ),
      ),

      //  Container(
      //   padding: const EdgeInsets.all(2),
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(50), color: kBlueAccentColor),
      //   child: CircleAvatar(
      //     backgroundImage: NetworkImage(model.imageUrl ?? ""),
      //     onBackgroundImageError: (exception, stackTrace) =>
      //         const CircleAvatar(child: byDefaultImage),
      //     radius: 25,
      //     backgroundColor: kBlueAccentColor,
      //     child: byDefaultImage,
      //   ),
      // ),

      title: Text(model.userName ?? ""),
      subtitle: model.appointmentStartTime != null
          ? Container(
              width: 200,
              padding: const EdgeInsets.all(5),

              // alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => navigatorPush(context, const AppoinmentsScreen()),
                child: Text(
                  "${dateTimetoTimeConverter(model.appointmentStartTime!)} ${model.appointmentStartTime!.hour > 12 ? "PM" : "AM"}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: kBlueAccentColor),
                ),
              ))
          : Text(model.lastMessage ?? "Tap to chat"),
      trailing: model.uId == senderId
          ? Text(dateFormatter(model.lastMessageTime.toString()))
          : model.isRead == true
              ? Text(model.lastMessageTime == null
                  ? ""
                  : dateFormatter(model.lastMessageTime.toString()))
              : const CircleAvatar(
                  radius: 7,
                  child: byDefaultImage,
                ),
    );
  }
}
