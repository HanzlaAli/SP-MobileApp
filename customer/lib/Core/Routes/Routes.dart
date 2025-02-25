// ignore_for_file: file_names
import '../../Presentation/Screens/Profile/Profile.dart';
import '../../Presentation/Screens/ServicesScreens/ServicesScreen.dart';
import '../../Presentation/Screens/Splash/OnBoarding.dart';
import '../../Presentation/Screens/User/ForgetPassword/ForgetPassword.dart';
import '../../Presentation/Screens/User/ForgetPassword/NewPasswordScreen.dart';
import '../../Presentation/Screens/User/ForgetPassword/OtpScreen.dart';
import '../../Presentation/Screens/User/LogIn/LogIn.dart';
import '../../Presentation/Screens/User/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Presentation/Screens/Splash/SplashScreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LogInScreen.routeName: (context) => const LogInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  OtpScreen.routeName: (context) =>  OtpScreen(),
  NewPasswordScreen.routeName: (context) =>  NewPasswordScreen(),
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ServicesScreen.routeName: (context) => const ServicesScreen(),
};
void navigatorPushAndRemoveUntil(BuildContext context, Widget route) {
  try {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: route,
        ),
        (route) => false);
  } catch (e) {}
}

void navigatorPush(BuildContext context, Widget route) {
  try {
    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: route,
        ));
  } catch (e) {}
}
