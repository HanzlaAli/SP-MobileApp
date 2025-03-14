// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Core/Services/ChatService.dart';
import '../../../Data/Models/FireBaseUserModel/ChatHeadChatUserModel.dart';
import '../../../Presentation/Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../Presentation/Screens/Chat/Chat.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MyIcons.dart';
import '../../helper/ReusedFunctions.dart';
import '../../Controllers/ChatController.dart';
import '../../Widgets/MyTextField.dart';
import '../Appoinments/GetAllAppoinments.dart';

class ChatHeadScreen extends StatefulWidget {
  const ChatHeadScreen({super.key});

  @override
  State<ChatHeadScreen> createState() => _ChatHeadScreenState();
}

class _ChatHeadScreenState extends State<ChatHeadScreen> {
  ChatService service = ChatService();

  GetProfileLoaded? getUserProfileLoaded;
  @override
  void initState() {
    var state = BlocProvider.of<GetProfileBloc>(context).state;
    if (state is GetProfileLoaded) {
      getUserProfileLoaded = state;
    }
    super.initState();
  }

  List<ChatHeadChatUserModel>? filteredList;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              service.getChatHead(
                  currentUserId: getUserProfileLoaded!
                      .serviceProviderProfileModel!.user!.id);
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder<List<ChatHeadChatUserModel>>(
                future: service.getChatHead(
                    currentUserId: getUserProfileLoaded!
                        .serviceProviderProfileModel!.user!.id),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return _shimmer(context);
                  // } else
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
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
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: filteredList?.length ??
                              snapshot.data?.length ??
                              0,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 73,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Column(
                                children: [
                                  MyListTile(
                                    model: filteredList?[index] ??
                                        snapshot.data![index],
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
          ),
        );
      },
    );
  }

  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: double.infinity,
                          height: 8.0,
                          color: Colors.white,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                          width: 40.0,
                          height: 8.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            itemCount: 6,
          ),
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
                  .where((x) =>
                      x.userName!.toLowerCase().contains(val.toLowerCase()) ||
                      x.lastMessage!.toLowerCase().contains(val.toLowerCase()))
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
}

class MyListTile extends StatelessWidget {
  ChatHeadChatUserModel model;
  int? senderId;
  MyListTile({
    super.key,
    required this.model,
    this.senderId,
  });
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
      title: Text(model.userName ?? ""),
      subtitle: model.appointmentStartTime != null
          ? GestureDetector(
              onTap: () =>
                  navigatorPushAndRemoveUntil(context, AppoinmentsScreen()),
              child: Text(
                "${dateTimetoTimeConverter(model.appointmentStartTime!)} ${model.appointmentStartTime!.hour > 12 ? "PM" : "AM"}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
            )
          : Text(model.lastMessage ?? "Tap to chat"),
      trailing: model.uId == senderId
          ? Text(dateFormatter(model.lastMessageTime.toString()))
          : model.isRead == true
              ? Text(model.lastMessageTime == null
                  ? ""
                  : dateFormatter(model.lastMessageTime.toString()))
              : const CircleAvatar(
                  radius: 7,
                  backgroundColor: kBlueAccentColor,
                ),
    );
  }
}
