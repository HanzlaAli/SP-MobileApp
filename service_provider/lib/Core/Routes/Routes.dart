// ignore_for_file: file_names
import '../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';
import '../../Presentation/Screens/Services/services_screen.dart';
import '../../Presentation/Screens/Profile/Profile.dart';
import '../../Presentation/Screens/Splash/OnBoarding.dart';
import '../../Presentation/Screens/User/ForgetPassword/ForgetPassword.dart';
import '../../Presentation/Screens/User/ForgetPassword/NewPasswordScreen.dart';
import '../../Presentation/Screens/User/ForgetPassword/OtpScreen.dart';
import '../../Presentation/Screens/User/LogIn/LogIn.dart';
import '../../Presentation/Screens/User/SignUp/SignUp.dart';
import '../../Presentation/Screens/User/SignUp/SignUp2.dart';
import '../../Presentation/Screens/User/SignUp/SignUp3.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../Presentation/Screens/Splash/SplashScreen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUp3.routeName: (context) => SignUp3(),
  SignUp2.routeName: (context) => SignUp2(),
  LogInScreen.routeName: (context) => LogInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),

  // VideoCallScreen.routeName: (context) => VideoCallScreen(),
  // CreateAppoinmentScreen.routeName: (context) =>
  //     CreateAppoinmentScreen(model: GetCustomerBookedServiceModel()),
  ForgetPasswordScreen.routeName: (context) => ForgetPasswordScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  NewPasswordScreen.routeName: (context) => NewPasswordScreen(),
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ServiceScreen.routeName: (context) => ServiceScreen(),
};
void navigatorPushAndRemoveUntil(BuildContext context, Widget route) {
  Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: route,
      ),
      (route) => false);
}

void navigatorPush(BuildContext context, Widget route) {
  Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: route,
      ));
}
