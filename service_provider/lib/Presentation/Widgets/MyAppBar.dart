// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';
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
                SizedBox(
                  width: 50,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: kWhiteColor,
                      )),
                ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
