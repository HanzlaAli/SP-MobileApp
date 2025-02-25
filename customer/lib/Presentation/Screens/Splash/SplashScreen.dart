// ignore_for_file: file_names
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import '../../Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../../helper/Constants.dart';
import '../../Bloc/AppOpened/app_opened_bloc.dart';
import '../../Bloc/AuthBloc/auth_bloc.dart';
import '../../../Presentation/Screens/Splash/OnBoarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Widgets/WebDrawer.dart';
import '../ErrorHandling/NoInternetScreen.dart';
import '../Home/Home.dart';
import '../User/LogIn/LogIn.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkInternetConnectivity() {
    Connectivity().checkConnectivity().then(
      (result) {
        if (result == ConnectivityResult.none) {
          navigatorPushAndRemoveUntil(context, const NoInternetScreen());
        }
      },
    );
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        navigatorPushAndRemoveUntil(context, const NoInternetScreen());
      } else {
        navigatorPushAndRemoveUntil(context, const SplashScreen());
      }
    });
  }

  AuthStateBase? authState;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(IsLoggedIn());
    BlocProvider.of<AppOpenedBloc>(context).add(IsAppOpenedEvent());
    checkInternetConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppOpenedBloc, AppOpenedStateBase>(
      listener: (context, state) {
        if (state is AppOpenedState) {
          authState = BlocProvider.of<AuthBloc>(context).state;
          if (authState is AuthenticatedState) {
            BlocProvider.of<GetUserProfileBloc>(context)
                .add(GetUserProfileEvent());
            BlocProvider.of<ActiveNotActiveUserBloc>(context).add(UserActive());

            if (kIsWeb) {
              //    navigatorPushAndRemoveUntil(context, MyWebDrawer());
            } else {
              Timer(const Duration(seconds: 3),
                  () => navigatorPushAndRemoveUntil(context, HomeScreen()));
            }
          } else {
            Future.delayed(const Duration(seconds: 3),
                () => navigatorPushAndRemoveUntil(context, LogInScreen()));
          }
        } else if (state is AppNotOpenedState) {
          if (kIsWeb) {
            navigatorPushAndRemoveUntil(context, LogInScreen());
          } else {
            Future.delayed(
                const Duration(seconds: 3),
                () => navigatorPushAndRemoveUntil(
                    context, const OnBoardingScreen()));
          }
        }
      },
      child: Scaffold(
        body: Container(
          width: kMaximumWidgth,
          decoration: const BoxDecoration(
            color: kWhiteColor,
            // gradient: kPrimaryColorGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Images/AppLogo.png',
                  height: kIsWeb ? 400 : Get.height * 0.8),
            ],
          ),
        ),
      ),
    );
  }
}
