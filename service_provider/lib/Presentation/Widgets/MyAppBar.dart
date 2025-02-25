// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/Routes/Routes.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';
import '../Screens/Chat/ChatHead.dart';
import '../helper/Constants/MyColors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Widget? trailing;

  bool isDrawer, isHome;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  MyAppBar({
    super.key,
    this.trailing,
    this.isDrawer = true,
    this.isHome = false,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          height: 90,
          color: kPrimaryColor,
          child: SafeArea(
            child: Row(
              children: [
                isDrawer != true
                    ? SizedBox(
                        width: 50,
                        child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back_ios_rounded,
                              color: kWhiteColor,
                            )),
                      )
                    :
                    // !kIsWeb
                    //     ?
                    SizedBox(
                        width: 50,
                        child: IconButton(
                            onPressed: () => Scaffold.of(context).openDrawer(),
                            icon: Image.asset(
                              'assets/Images/drawerIcon.png',
                              height: 100,
                              width: 100,
                              color: kWhiteColor,
                            )),
                      ), //  : SizedBox(),
                const SizedBox(
                    width: 16), // Add spacing between back button and title
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kWhiteColor, // Text color
                  ),
                ),
                const Expanded(
                    child:
                        SizedBox()), // Add spacing between title and trailing
                trailing ?? const SizedBox(),
                isHome == true
                    ? GestureDetector(
                        onTap: () {
                          navigatorPush(context, const ChatHeadScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.message_rounded,color: kWhiteColor,)                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
