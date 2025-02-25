// ignore_for_file: file_names

import '../../Presentation/Bloc/LogOutBloc/log_out_bloc.dart';
import '../../Presentation/Screens/Appoinments/AppointmentDocumentScreen.dart';
import '../../Presentation/Screens/Home/Home.dart';
import '../../Presentation/Screens/Settings/SettingsMenu.dart';
import '../../Presentation/helper/Constants/MyColors.dart';
import '../../Presentation/Bloc/TransactionBloc/transaction_bloc.dart';
import '../../Presentation/Screens/Profile/Profile.dart';
import '../../Presentation/Screens/Services/ServicesScreen.dart';
import '../../Presentation/Screens/User/LogIn/LogIn.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../Core/Routes/Routes.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';
import '../Screens/Appoinments/AppointmentHistoryScreen.dart';
import '../helper/Constants/MySpaces.dart';
import '../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';
import '../Bloc/GetProfileBloc/get_profile_bloc.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? profileImage;
  String? selectePage;
  String? userName;
  @override
  void initState() {
    var profileState = BlocProvider.of<GetProfileBloc>(context).state;
    if (profileState is GetProfileLoaded) {
      var profile = profileState.serviceProviderProfileModel;
      profileImage = '${profile!.profilePicture}';
      userName = '${profile.user!.firstName} ${profile.user!.lastName}';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themestate) {
        return Drawer(
          backgroundColor:
              themestate is DarkThemeState ? kBlackColor : kWhiteColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: kIsWeb ? 210 : 200,
                width: 200,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    navigatorPushAndRemoveUntil(context, const ProfileScreen());
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 180, top: 50),
                        width: 100,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                '$profileImage',
                              ),
                            ),
                            verticalSpacing20,
                            Text(
                              '$userName',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: themestate is DarkThemeState
                                      ? kWhiteColor
                                      : kBlackColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : selectePage == "Home"
                              ? kPrimaryColor
                              : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectePage = "Home";
                  setState(() {});
                  navigatorPushAndRemoveUntil(context, const HomeScreen());
                },
              ),
              ListTile(
                title: Text(
                  'My Services',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : selectePage == "My Services"
                              ? kPrimaryColor
                              : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectePage = "My Services";
                  setState(() {});

                  navigatorPushAndRemoveUntil(context, const ServiceScreen());
                },
              ),
              kIsWeb
                  ? ListTile(
                      title: Text(
                        'Withdrawal',
                        style: TextStyle(
                            color: themestate is DarkThemeState
                                ? kWhiteColor
                                : selectePage == "Withdrawal"
                                    ? kPrimaryColor
                                    : kBlackColor),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        selectePage = "My Services";
                        setState(() {});
                      },
                    )
                  : const SizedBox(),
              ListTile(
                title: Text(
                  'Appointment History',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : selectePage == "Appointment History"
                              ? kPrimaryColor
                              : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectePage = "Appointments History";
                  setState(() {});

                  navigatorPushAndRemoveUntil(
                      context, const AppointmentHistoryScreen());
                },
              ),
              ListTile(
                title: Text(
                  'Appointment Document',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : selectePage == "Appointment Document"
                              ? kPrimaryColor
                              : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectePage = "Appointment Document";
                  setState(() {});

                  navigatorPushAndRemoveUntil(
                      context, const AppointmentDocumentScreen());
                },
              ),
              ListTile(
                title: Text(
                  'Appointments',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : selectePage == "Appointments"
                              ? kPrimaryColor
                              : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectePage = "Appointments";
                  setState(() {});

                  navigatorPushAndRemoveUntil(
                      context,
                      AppoinmentsScreen(
                        fromDrawer: true,
                      ));
                },
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);

                  navigatorPush(context, const SettingsMenuScreen());
                },
              ),
              ListTile(
                title: Text(
                  'Log Out',
                  style: TextStyle(
                      color: themestate is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
                  navigatorPushAndRemoveUntil(context, const LogInScreen());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _shimmer(BuildContext context) {
    return Container(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[350]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
        ),
      ),
    );
  }
}
