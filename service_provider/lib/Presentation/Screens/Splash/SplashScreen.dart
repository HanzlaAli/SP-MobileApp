// ignore_for_file: file_names
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../Presentation/helper/Constants/Constants.dart';
import '../../../Presentation/Bloc/AuthBloc/auth_bloc.dart';
import '../../../Presentation/Screens/Splash/OnBoarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Core/Routes/Routes.dart';
import '../../helper/Constants/MyColors.dart';
import '../../Bloc/AppOpenedBloc/app_opened_bloc.dart';
import '../../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../Widgets/WebDrawer.dart';
import '../ErrorHandling/NoInternetScreen.dart';
import '../Home/Home.dart';
import '../User/LogIn/LogIn.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context).add(isLoggedIn());
    BlocProvider.of<AppOpenedBloc>(context).add(IsAppOpenedEvent());
    checkInternetConnectivity();
    super.initState();
  }

  AuthStateBase? authState;
  void checkInternetConnectivity() {
    Connectivity().checkConnectivity().then((result) {
      if (result == ConnectivityResult.none) {
        navigatorPushAndRemoveUntil(context, const NoInternetScreen());
      }
    });
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        navigatorPushAndRemoveUntil(context, const NoInternetScreen());
      } else {
        navigatorPushAndRemoveUntil(context, const SplashScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ///Just for checking
    // Future.delayed(const Duration(seconds: 2), () {
    //   navigatorPushAndRemoveUntil(
    //       context,
    //       WeekDayScreen(
    //         isNew: true,
    //       ));
    // });
    return BlocListener<AppOpenedBloc, AppOpenedStateBase>(
      listener: (context, state) {
        if (state is AppOpenedState) {
          authState = BlocProvider.of<AuthBloc>(context).state;
          if (authState is AuthenticatedState) {
            BlocProvider.of<GetProfileBloc>(context)
                .add(GetServiceProviderProfileEvent());
            if (kIsWeb) {
              navigatorPushAndRemoveUntil(context, const MyWebDrawer());
            } else {
              Future.delayed(
                  const Duration(seconds: 3),
                  () =>
                      navigatorPushAndRemoveUntil(context, const HomeScreen()));
            }
          } else {
            Future.delayed(
                const Duration(seconds: 3),
                () =>
                    navigatorPushAndRemoveUntil(context, const LogInScreen()));
          }
        } else if (state is AppNotOpenedState) {
          if (kIsWeb) {
            navigatorPushAndRemoveUntil(context, const LogInScreen());
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
