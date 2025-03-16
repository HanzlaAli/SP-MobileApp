import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mended_soluctions/Presentation/Screens/Home/order_history.dart';
import 'package:mended_soluctions/Presentation/Screens/Profile/Profile.dart';
import 'package:mended_soluctions/Presentation/Screens/complaint/complaint.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyAppBar.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/Screens/AboutUs/AboutUs.dart';
import '../../../Presentation/Screens/AppointmentSchedule/WeekDaysScreen.dart';
import '../../../Presentation/Screens/PrivacyPolicy/PrivacyPolicyScreen.dart';
import '../../../Presentation/Screens/ChangePassword/ChangePasswordScreen.dart';
import '../../../Presentation/Screens/Settings/DeleteAccountScreen.dart';
import '../../../Presentation/Screens/TermsOfUse/TermsOfUse.dart';
import '../../Bloc/GetServiceProviderDetailBloc/get_serviceProvider_details_bloc.dart';
import '../../Bloc/LogOutBloc/log_out_bloc.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import '../Appoinments/AppointmentHistoryScreen.dart';
import '../CustomerRequests/customer_request.dart';
import '../User/LogIn/LogIn.dart';

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
            appBar: MyAppBar(title: 'Settings'),
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 5),
                child: Column(children: [
                  ListItems(
                    icon: Icons.person,
                    onTap: () {
                      navigatorPush(context, const ProfileScreen());
                    },
                    title: 'My Profile',
                  ),
                  ListItems(
                    icon: Icons.history,
                    onTap: () {
                      navigatorPush(context, const AppointmentHistoryScreen());
                    },
                    title: 'Appointment History',
                  ),
                  ListItems(
                    icon: Icons.done,
                    onTap: () {
                      navigatorPush(context, const OrderHistory());
                    },
                    title: 'My Orders',
                  ),
                  ListItems(
                    icon: Icons.access_time_outlined,
                    onTap: () {
                      navigatorPush(
                          context,
                          WeekDayScreen(
                            isNew: false,
                          ));
                    },
                    title: 'Manage Availability',
                  ),
                  ListItems(
                    icon: Icons.error,
                    onTap: () {
                      navigatorPush(context, const ComplaintScreen());
                    },
                    title: 'Complaints',
                  ),
                  ListItems(
                    icon: Icons.lock,
                    onTap: () {
                      navigatorPush(context, ChangePasswordScreen());
                    },
                    title: 'Change Password',
                  ),
                  ListItems(
                    icon: Icons.delete,
                    onTap: () {
                      navigatorPush(context, DeleteAccountScreen());
                    },
                    title: 'Delete Account',
                  ),
                  ListItems(
                    icon: Icons.privacy_tip,
                    onTap: () {
                      navigatorPush(context, const PrivacyPolicyScreen());
                    },
                    title: 'Privacy Policy',
                  ),
                  ListItems(
                    icon: Icons.file_copy_rounded,
                    onTap: () {
                      navigatorPush(context, const TermToUseScreen());
                    },
                    title: 'Terms Of Use',
                  ),
                  ListItems(
                    icon: Icons.info,
                    onTap: () {
                      navigatorPush(context, const AboutUsScreen());
                    },
                    title: 'About Us',
                  ),
                  ListItems(
                    icon: Icons.download,
                    onTap: () {
                      BlocProvider.of<GetDetailBloc>(context)
                          .add(GetServiceProviderDetailEvent());
                    },
                    title: 'Download your information',
                  ),
                  ListItems(
                    icon: Icons.logout,
                    onTap: () {
                      BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
                      navigatorPushAndRemoveUntil(context, const LogInScreen());
                    },
                    title: 'Log Out',
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ListItems extends StatelessWidget {
  ListItems(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  String title;
  IconData icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBlackColor12.withValues(),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: kWhiteColor,
          child: Icon(icon, color: kSecondaryColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        trailing: const Icon(Icons.arrow_right_rounded),
      ),
    );
  }
}
