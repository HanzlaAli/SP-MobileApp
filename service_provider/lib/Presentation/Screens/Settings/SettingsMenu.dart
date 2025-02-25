import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/Screens/AboutUs/AboutUs.dart';
import '../../../Presentation/Screens/AppointmentSchedule/WeekDaysScreen.dart';
import '../../../Presentation/Screens/PrivacyPolicy/PrivacyPolicyScreen.dart';
import '../../../Presentation/Screens/ChangePassword/ChangePasswordScreen.dart';
import '../../../Presentation/Screens/Settings/DeleteAccountScreen.dart';
import '../../../Presentation/Screens/TermsOfUse/TermsOfUse.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../Bloc/GetServiceProviderDetailBloc/get_serviceProvider_details_bloc.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../helper/Constants/MyColors.dart';

class SettingsMenuScreen extends StatelessWidget {
  const SettingsMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetDetailBloc, GetServiceProviderDetailStateBase>(
      listener: (context, state) {
        if (state is GetServiceProviderDetailLoaded) {
          Get.snackbar("Downloaded!", "Your information is downloaded");
        }
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themestate) {
          return Scaffold(
            backgroundColor:
                themestate is DarkThemeState ? kBlackColor : kWhiteColor,
            appBar: MyAppBar(title: 'Settings', isDrawer: false),
            body: Container(
              margin: const EdgeInsets.only(top: 5),
              child: Column(children: [
                ListTile(
                  leading: Icon(
                    Icons.access_time_outlined,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'Manage Availability',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    navigatorPush(
                        context,
                        WeekDayScreen(
                          isNew: false,
                        ));
                  },
                ),
                Divider(
                  color: themestate is DarkThemeState
                      ? kWhiteColor
                      : kBlackColor12,
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'Change Password',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    navigatorPush(context, ChangePasswordScreen());
                  },
                ),
                Divider(
                  color: themestate is DarkThemeState
                      ? kWhiteColor
                      : kBlackColor12,
                ),

                // ListTile(
                //   leading: Icon(
                //     Icons.light_mode,
                //     color:
                //         themestate is DarkThemeState ? kWhiteColor : kBlackColor,
                //   ),
                //   title: Text(
                //     'Theme',
                //     style: TextStyle(
                //       color: themestate is DarkThemeState
                //           ? kWhiteColor
                //           : kBlackColor,
                //     ),
                //   ),
                //   onTap: () {
                //     navigatorPush(context, const ThemeScreen());
                //   },
                // ),
                ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'Delete Account',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    navigatorPush(context, DeleteAccountScreen());
                  },
                ),
                Divider(
                  thickness: 0.1,
                  color:
                      themestate is DarkThemeState ? kWhiteColor : kBlackColor,
                ),
                ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    navigatorPush(context, const PrivacyPolicyScreen());
                  },
                ),
                Divider(
                  thickness: 0.1,
                  color:
                      themestate is DarkThemeState ? kWhiteColor : kBlackColor,
                ),
                ListTile(
                  leading: Icon(
                    Icons.file_copy_rounded,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'Terms Of Use',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    navigatorPush(context, const TermToUseScreen());
                  },
                ),
                Divider(
                  thickness: 0.1,
                  color:
                      themestate is DarkThemeState ? kWhiteColor : kBlackColor,
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    navigatorPush(context, const AboutUsScreen());
                  },
                ),
                Divider(
                  thickness: 0.1,
                  color:
                      themestate is DarkThemeState ? kWhiteColor : kBlackColor,
                ),
                ListTile(
                  leading: Icon(
                    Icons.download,
                    color: themestate is DarkThemeState
                        ? kWhiteColor
                        : kBlackColor,
                  ),
                  title: Text(
                    'Download your information',
                    style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor,
                    ),
                  ),
                  onTap: () {
                    BlocProvider.of<GetDetailBloc>(context)
                        .add(GetServiceProviderDetailEvent());
                  },
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
