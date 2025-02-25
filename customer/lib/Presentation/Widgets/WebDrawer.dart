// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../Presentation/helper/Constants.dart';
// import 'package:sidebarx/sidebarx.dart';

// import '../../Core/Routes/Routes.dart';
// import '../Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
// import '../Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
// import '../Bloc/LogOutBloc/log_out_bloc.dart';
// import '../Screens/Appoinments/GetAllAppoinments.dart';
// import '../Screens/BookedServices/CustomerBookedServices.dart';
// import '../Screens/ServiceProviders/ServiceProviderScreen.dart';
// import '../Screens/Profile/Profile.dart';
// import '../Screens/ServicesScreens/ServicesScreen.dart';
// import '../Screens/User/LogIn/LogIn.dart';

// final divider = Divider(color: kWhiteColor.withOpacity(0.3), height: 1);

// class MyWebDrawer extends StatefulWidget {
//   const MyWebDrawer({super.key});

//   @override
//   State<MyWebDrawer> createState() => _MyWebDrawerState();
// }

// class _MyWebDrawerState extends State<MyWebDrawer> {
//   final _controller = SidebarXController(selectedIndex: 0, extended: false);
//   final _key = GlobalKey<ScaffoldState>();
//   Widget? child = const ServicesScreen();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Builder(
//         builder: (context) {
//           //  final isSmallScreen = MediaQuery.of(context).size.width < 600;
//           return Scaffold(
//             key: _key,
//             drawer: ExampleSidebarX(
//               controller: _controller,
//               onDataReceived: (recivedwidget) {
//                 // recivedwidget = widget;
//                 // setState(() {});
//               },
//             ),
//             body: Row(
//               children: [
//                 // ExampleSidebarX(
//                 //   controller: _controller,
//                 //   onDataReceived: (recivedwidget) {
//                 //     recivedwidget = widget;
//                 //     setState(() {});
//                 //   },
//                 // ),
//                 Expanded(
//                   child: Center(
//                     child: widget,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ExampleSidebarX extends StatefulWidget {
//   ExampleSidebarX({
//     Key? key,
//     required this.onDataReceived,
//     required SidebarXController controller,
//   })  : _controller = controller,
//         super(key: key);

//   final SidebarXController _controller;
//   final Function(Widget) onDataReceived;

//   @override
//   State<ExampleSidebarX> createState() => _ExampleSidebarXState();
// }

// class _ExampleSidebarXState extends State<ExampleSidebarX> {
//   String? profileImage;
//   String? userName;

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<GetUserProfileBloc, GetUserProfileStateBase>(
//       listener: (context, state) {
//         if (state is GetUserProfileLoaded) {
//           var profile = state.CustomerProfileModel;
//           profileImage = '${profile!.profilePicture}';
//           userName = '${profile.user!.firstName} ${profile.user!.lastName}';
//           setState(() {});
//         }
//       },
//       child: SidebarX(
//         controller: widget._controller,
//         theme: SidebarXTheme(
//           margin: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: kBlackColor45,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           hoverColor: kBlueAccentColor,
//           textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
//           selectedTextStyle: const TextStyle(color: Colors.white),
//           itemTextPadding: const EdgeInsets.only(left: 30),
//           selectedItemTextPadding: const EdgeInsets.only(left: 30),
//           itemDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: kPrimaryColor),
//           ),
//           selectedItemDecoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: kBlackColor.withOpacity(0.37),
//             ),
//             gradient: const LinearGradient(
//               colors: [kPrimaryColor, kPrimaryColor],
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.28),
//                 blurRadius: 30,
//               )
//             ],
//           ),
//           iconTheme: IconThemeData(
//             color: Colors.white.withOpacity(0.7),
//             size: 20,
//           ),
//           selectedIconTheme: const IconThemeData(
//             color: Colors.white,
//             size: 20,
//           ),
//         ),
//         extendedTheme: const SidebarXTheme(
//           width: 200,
//           decoration: BoxDecoration(
//             color: kSecondaryColor,
//           ),
//         ),
//         footerDivider: divider,
//         headerBuilder: (context, extended) {
//           return SizedBox(
//             height: 200,
//             width: 200,
//             child: GestureDetector(
//               onTap: () {
//                 widget.onDataReceived(const ProfileScreen());
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(right: 180, top: 50),
//                 width: 100,
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                         backgroundColor: kBlackColor38,
//                         radius: 50,
//                         backgroundImage: NetworkImage(
//                           '$profileImage',
//                         ),
//                         child: byDefaultImage,
//                         onBackgroundImageError: (_, __) {
//                           const CircleAvatar(
//                             backgroundColor: kBlackColor38,
//                             child: byDefaultImage,
//                           );
//                         }),
//                     verticalSpacing20,
//                     Text(
//                       '$userName',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w600, fontSize: 18),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//         items: [
//           SidebarXItem(
//             icon: Icons.home,
//             label: 'Home',
//             onTap: () {
//               debugPrint('Home');
//             },
//           ),
//           SidebarXItem(
//             label: 'Services',
//             icon: Icons.check_circle_rounded,
//             onTap: () {
//               setState(() {
//                 widget.onDataReceived(const ServicesScreen());
//               });
//             },
//           ),
//           SidebarXItem(
//             label: 'ServiceProviders',
//             icon: Icons.medical_services_outlined,
//             onTap: () {
//               setState(() => widget.onDataReceived(const ServiceProviderScreen()));
//             },
//           ),
//           SidebarXItem(
//             label: 'Appointments',
//             icon: Icons.access_time,
//             onTap: () {
//               setState(() => widget.onDataReceived(const AppoinmentsScreen()));
//             },
//           ),
//           // CollapsibleItem(
//           //   text: 'Cart',
//           //   icon: Icons.shopping_cart_outlined,
//           //   onPressed: () => setState(() => child = CartScreen()),
//           // ),
//           SidebarXItem(
//             label: 'My Services',
//             icon: Icons.check_outlined,
//             onTap: () {
//               setState(() {
//                 widget.onDataReceived(const CustomerBookedServicesScreen());
//               });
//             },
//           ),
//           // CollapsibleItem(
//           //   text: 'Appointments',
//           //   icon: Icons.access_time,
//           //   onPressed: () {
//           //     setState(() => child = AppoinmentsScreen());
//           //   },
//           // ),
//           // CollapsibleItem(
//           //   text: 'Appointment Requests',
//           //   icon: Icons.request_page,
//           //   onPressed: () {
//           //     setState(() => child = const RequestappointmentByCustomerScreen());
//           //   },
//           // ),
//           SidebarXItem(
//               label: 'Log Out',
//               icon: Icons.logout_rounded,
//               onTap: () {
//                 BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
//                 BlocProvider.of<ActiveNotActiveUserBloc>(context)
//                     .add(UserNonActive());

//                 navigatorPushAndRemoveUntil(context, const LogInScreen());
//               })
//         ],
//       ),
//     );
//   }
// }


// // import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import '../../Presentation/Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
// // import '../../Presentation/Screens/ServiceProviders/ServiceProviderScreen.dart';
// // import '../../Presentation/Screens/Profile/Profile.dart';
// // import '../../Presentation/Screens/User/LogIn/LogIn.dart';
// // import 'package:sidebarx/sidebarx.dart';
// // import '../../Core/Routes/Routes.dart';
// // import '../helper/Constants.dart';
// // import '../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';
// // import '../Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
// // import '../Bloc/LogOutBloc/log_out_bloc.dart';
// // import '../Screens/BookedServices/CustomerBookedServices.dart';
// // import '../Screens/ServicesScreens/ServicesScreen.dart';

// // class MyWebDrawer extends StatefulWidget {
// //   const MyWebDrawer({
// //     super.key,
// //   });

// //   @override
// //   State<MyWebDrawer> createState() => _MyWebDrawerState();
// // }

// // class _MyWebDrawerState extends State<MyWebDrawer> {
// //   List<SidebarXItem>? _items;
// //   final _controller = SidebarXController(selectedIndex: 0, extended: true);
// //   List<SidebarXItem> get _generateItems {
// //     return [
// //       SidebarXItem(
// //         label: 'Services',
// //         icon: Icons.check_circle_rounded,
// //         onTap: () {
// //           setState(() {
// //             child = const ServicesScreen();
// //           });
// //         },
// //       ),
// //       SidebarXItem(
// //         label: 'ServiceProviders',
// //         icon: Icons.medical_services_outlined,
// //         onTap: () {
// //           setState(() => child = const ServiceProviderScreen());
// //         },
// //       ),
// //       SidebarXItem(
// //         label: 'Appointments',
// //         icon: Icons.access_time,
// //         onTap: () {
// //           setState(() => child = const AppoinmentsScreen());
// //         },
// //       ),
// //       // CollapsibleItem(
// //       //   text: 'Cart',
// //       //   icon: Icons.shopping_cart_outlined,
// //       //   onPressed: () => setState(() => child = CartScreen()),
// //       // ),
// //       SidebarXItem(
// //         label: 'My Services',
// //         icon: Icons.check_outlined,
// //         onTap: () {
// //           setState(() {
// //             child = const CustomerBookedServicesScreen();
// //           });
// //         },
// //       ),
// //       // CollapsibleItem(
// //       //   text: 'Appointments',
// //       //   icon: Icons.access_time,
// //       //   onPressed: () {
// //       //     setState(() => child = AppoinmentsScreen());
// //       //   },
// //       // ),
// //       // CollapsibleItem(
// //       //   text: 'Appointment Requests',
// //       //   icon: Icons.request_page,
// //       //   onPressed: () {
// //       //     setState(() => child = const RequestappointmentByCustomerScreen());
// //       //   },
// //       // ),
// //       SidebarXItem(
// //         label: 'Log Out',
// //         icon: Icons.logout_rounded,
// //         onTap: () {
// //           BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
// //           BlocProvider.of<ActiveNotActiveUserBloc>(context)
// //               .add(UserNonActive());

// //           navigatorPushAndRemoveUntil(context, const LogInScreen());
// //         },
// //       ),
// //     ];
// //   }

// //   Widget? child = const ServicesScreen();
// //   String? profileImage;
// //   String? userName;
// //   @override
// //   void initState() {
// //     _items = _generateItems;
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: BlocListener<GetUserProfileBloc, GetUserProfileStateBase>(
// //         listener: (context, state) {
// //           if (state is GetUserProfileLoaded) {
// //             var profile = state.CustomerProfileModel;
// //             profileImage = '${profile!.profilePicture}';
// //             userName = '${profile.user!.firstName} ${profile.user!.lastName}';
// //             setState(() {});
// //           }
// //         },
// //         child: Scaffold(
// //           body: SidebarX(
// //             items: _items!,
// //             controller: _controller,

// //             // avatarImg: NetworkImage(profileImage ?? ""),
// //             // title: userName ?? "",
// //             // onTitleTap: () {
// //             //   setState(() {
// //             //     child = const ProfileScreen();
// //             //   });
// //             // },
// //             // body: Container(
// //             //     // margin: EdgeInsets.only(
// //             //     //     left: MediaQuery.of(context).size.width <= 800 ? 200 : 0),
// //             //     child: child!),
// //             // backgroundColor: kBlueAccentColor,
// //             // selectedTextColor: kWhiteColor,
// //             // textStyle: const TextStyle(
// //             //   fontSize: 15,
// //             // ),
// //             // titleStyle: const TextStyle(
// //             //   fontSize: 20,
// //             // ),
// //             // toggleTitleStyle: const TextStyle(fontSize: 15),
// //             // unselectedIconColor: kWhiteColor,
// //             // unselectedTextColor: kWhiteColor,
// //             // iconSize: 25,
// //             // sidebarBoxShadow: const [
// //             //   BoxShadow(
// //             //     color: Colors.indigo,
// //             //     blurRadius: 20,
// //             //     spreadRadius: 0.01,
// //             //     offset: Offset(3, 3),
// //             //   ),
// //             //   BoxShadow(
// //             //     color: kPrimaryColor,
// //             //     blurRadius: 50,
// //             //     spreadRadius: 0.01,
// //             //     offset: Offset(3, 3),
// //             //   ),
// //             // ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // //  Drawer(
// // //       child: ListView(
// // //         // Important: Remove any padding from the ListView.
// // //         padding: EdgeInsets.zero,
// // //         children: [
// // //           const DrawerHeader(
// // //             decoration: BoxDecoration(
// // //               color: kPrimaryColor,
// // //             ),
// // //             child: Text('Mended Solutions'),
// // //           ),
// // //           ListTile(
// // //             title: const Text('Profile'),
// // //             onTap: () {
// // //               Navigator.pop(context);
// // //               navigatorPushAndRemoveUntil(context, const ProfileScreen());
// // //             },
// // //           ),
// // //           ListTile(
// // //             title: const Text('Requested Services'),
// // //             onTap: () {
// // //               Navigator.pop(context);

// // //               navigatorPushAndRemoveUntil(
// // //                   context, CustomerBookedServicesScreen());
// // //             },
// // //           ),
// // //           ListTile(
// // //             title: const Text('My Services'),
// // //             onTap: () {
// // //               Navigator.pop(context);

// // //               navigatorPushAndRemoveUntil(context, ServiceScreen());
// // //             },
// // //           ),
// // //           ListTile(
// // //             title: const Text('Appointments'),
// // //             onTap: () {
// // //               Navigator.pop(context);

// // //               navigatorPushAndRemoveUntil(context, AppoinmentsScreen());
// // //             },
// // //           ),
// // //           ListTile(
// // //             title: const Text('Log Out'),
// // //             onTap: () {
// // //               // Update the state of the app
// // //               // ...
// // //               // Then close the drawer
// // //               Navigator.pop(context);
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //     );
