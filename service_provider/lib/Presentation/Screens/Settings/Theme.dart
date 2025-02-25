import '../../../Presentation/Bloc/ThemeBloc/theme_bloc.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Presentation/helper/Constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themestate) {
        return Scaffold(
          backgroundColor:
              themestate is DarkThemeState ? kBlackColor : kWhiteColor,
          appBar: MyAppBar(title: 'Change Theme', isDrawer: false),
          body: Column(
            children: [
              ListTile(
                selected: true,
                selectedColor: themestate is DarkThemeState
                    ? kWhiteColor
                    : kPrimaryColor,
                selectedTileColor:
                    themestate is DarkThemeState ? kBlackColor : kWhiteColor,
                leading: Icon(
                  Icons.light_mode,
                  color: themestate is DarkThemeState
                      ? kWhiteColor
                      : kPrimaryColor,
                ),
                title: const Text('Light'),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(LightTheme());
                },
              ),
              ListTile(
                selected: true,
                selectedColor: themestate is DarkThemeState
                    ? kPrimaryColor
                    : kBlackColor,
                selectedTileColor:
                    themestate is DarkThemeState ? kBlackColor : kWhiteColor,
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(DarkTheme());
                },
                leading: Icon(
                  Icons.dark_mode,
                  color: themestate is DarkThemeState
                      ? kPrimaryColor
                      : kBlackColor,
                ),
                title: const Text('Dark'),
              ),
            ],
          ),
        );
      },
    );
  }
}
