import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../Widgets/MyAppBar.dart';
import '../../helper/Constants.dart';

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
                    : kBlueAccentColor,
                selectedTileColor:
                    themestate is DarkThemeState ? kBlackColor : kWhiteColor,
                leading: Icon(
                  Icons.light_mode,
                  color: themestate is DarkThemeState
                      ? kWhiteColor
                      : kBlueAccentColor,
                ),
                title: const Text('Light'),
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(LightTheme());
                },
              ),
              ListTile(
                selected: true,
                selectedColor: themestate is DarkThemeState
                    ? kBlueAccentColor
                    : kBlackColor,
                selectedTileColor:
                    themestate is DarkThemeState ? kBlackColor : kWhiteColor,
                onTap: () {
                  BlocProvider.of<ThemeBloc>(context).add(DarkTheme());
                },
                leading: Icon(
                  Icons.dark_mode,
                  color: themestate is DarkThemeState
                      ? kBlueAccentColor
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
