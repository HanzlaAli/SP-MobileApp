import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../Widgets/MyButton.dart';
import '../../helper/Constants.dart';
import '../Home/Home.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themestate) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.done_outlined,
                        size: 130,
                        color: themestate is DarkThemeState
                            ? kBlackColor
                            : kBlueAccentColor,
                      ),
                      const Text(
                        'Password Changed Successfully',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  verticalSpacing20,
                  verticalSpacing20,
                  MyButton(
                    onPressed: () {
                      navigatorPushAndRemoveUntil(context, HomeScreen());
                    },
                    fontColor: kWhiteColor,
                    bgColor: kBlueAccentColor,
                    buttonText: 'Home',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
