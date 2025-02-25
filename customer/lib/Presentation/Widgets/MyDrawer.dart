import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/Routes/Routes.dart';
import '../../Presentation/Screens/Home/Home.dart';
import '../../Presentation/helper/Constants.dart';
import '../../Presentation/Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import '../../Presentation/Bloc/LogOutBloc/log_out_bloc.dart';
import '../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';
import '../../Presentation/Screens/BookedServices/CustomerBookedServices.dart';
import '../../Presentation/Screens/Profile/Profile.dart';
import '../../Presentation/Screens/ServicesScreens/ServicesScreen.dart';
import '../Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../Screens/Appoinments/AppointmentDocumentScreen.dart';
import '../Screens/Appoinments/AppointmentHistoryScreen.dart';
import '../Screens/CustomerRequests/customer_request.dart';
import '../Screens/Payment/PaymentHistory.dart';
import '../Screens/ServiceProvider/ServiceProviderScreen.dart';
import '../Screens/Settings/SettingsMenu.dart';
import '../Screens/User/LogIn/LogIn.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    super.key,
  });

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String? profileImage;

  String? userName;

  @override
  void initState() {
    var profileState = BlocProvider.of<GetUserProfileBloc>(context).state;
    if (profileState is GetUserProfileLoaded) {
      var profile = profileState.customerProfileModel;
      profileImage = '${profile!.profilePicture}';
      userName = '${profile.user!.firstName} ${profile.user!.lastName}';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 200,
            width: 240,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                navigatorPushAndRemoveUntil(context, const ProfileScreen());
              },
              child: Container(
                margin: const EdgeInsets.only(right: 160, top: 50),
                width: 120,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: kBlackColor45,
                      backgroundImage: NetworkImage(
                        '$profileImage',
                      ),
                    ),

                    // CircleAvatar(
                    //     backgroundColor: kBlackColor38,
                    //     radius: 50,
                    //     backgroundImage: NetworkImage(
                    //       '$profileImage',
                    //     ),
                    //     child: byDefaultImage,
                    //     onBackgroundImageError: (_, __) {
                    //       const CircleAvatar(
                    //         backgroundColor: kBlackColor38,
                    //         child: byDefaultImage,
                    //       );
                    //     }),
                    verticalSpacing20,
                    Text(
                      '$userName',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(context, HomeScreen());
            },
          ),
          ListTile(
            title: const Text(
              'My Requests',
              style: TextStyle(color: kBlackColor),
            ),
            onTap: () {
              Navigator.pop(context);
              // BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
              navigatorPushAndRemoveUntil(
                  context, const CustomerRequestScreen());
            },
          ),
          ListTile(
            title: const Text('Services'),
            onTap: () {
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(context, const ServicesScreen());
            },
          ),
          ListTile(
            title: const Text('Service Providers'),
            onTap: () {
              Navigator.pop(context);
              navigatorPushAndRemoveUntil(
                  context, const ServiceProviderScreen());
            },
          ),
          ListTile(
            title: const Text('History'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(
                  context, const AppointmentHistoryScreen());
            },
          ),
          ListTile(
            title: const Text('Appointment Documents'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(
                  context, const AppointmentDocumentScreen());
            },
          ),
          ListTile(
            title: const Text('Transactions'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(
                  context, const PaymentHistoryScreen());
            },
          ),

          ListTile(
            title: const Text('My Services'),
            onTap: () {
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(
                  context, const CustomerBookedServicesScreen());
            },
          ),
          ListTile(
            title: const Text('Appointments'),
            onTap: () {
              Navigator.pop(context);

              navigatorPushAndRemoveUntil(context, const AppoinmentsScreen());
            },
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(
                color: kBlackColor,
                // color:
                //     themestate is DarkThemeState ? kWhiteColor : kBlackColor
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              navigatorPush(context, const SettingsMenuScreen());
            },
          ),
          // ListTile(
          //   title: const Text('Appointment Requests'),
          //   onTap: () {
          //     Navigator.pop(context);

          //     navigatorPushAndRemoveUntil(
          //         context, const RequestappointmentByCustomerScreen());
          //   },
          // ),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
              BlocProvider.of<ActiveNotActiveUserBloc>(context)
                  .add(UserNonActive());
              navigatorPushAndRemoveUntil(context, const LogInScreen());
            },
          ),
        ],
      ),
    );
  }
}
