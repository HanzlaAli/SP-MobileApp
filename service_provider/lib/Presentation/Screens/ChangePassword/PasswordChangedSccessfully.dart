import '../../../Presentation/Screens/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../Widgets/MyButton.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MySpaces.dart';

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
                            : kPrimaryColor,
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
                      navigatorPushAndRemoveUntil(context, const HomeScreen());
                    },
                    fontColor: kWhiteColor,
                    bgColor: kPrimaryColor,
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
