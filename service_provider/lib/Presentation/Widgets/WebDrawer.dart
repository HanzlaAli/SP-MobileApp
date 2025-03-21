// ignore_for_file: file_names
import '../../Presentation/Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../Screens/Services/services_screen.dart';
import '../../Presentation/Screens/User/LogIn/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';
import '../../Core/Routes/Routes.dart';
import '../Bloc/LogOutBloc/log_out_bloc.dart';
import '../Screens/Appoinments/AppointmentHistoryScreen.dart';
import '../Screens/Home/Home.dart';
import '../Screens/Settings/SettingsMenu.dart';
import '../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';

class MyWebDrawer extends StatefulWidget {
  const MyWebDrawer({
    super.key,
  });

  @override
  State<MyWebDrawer> createState() => _MyWebDrawerState();
}

class _MyWebDrawerState extends State<MyWebDrawer> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  List<SidebarXItem> _items = [];

  List<SidebarXItem> get _generateItems {
    return [
      SidebarXItem(
        label: 'Home',
        icon: Icons.home,
        onTap: () {
          setState(() => child = const HomeScreen());
        },
      ),
      SidebarXItem(
        label: 'My Services',
        icon: Icons.medical_services_outlined,
        onTap: () {
          setState(() => child = const ServiceScreen());
        },
      ),
      SidebarXItem(
        label: 'Appointment History',
        icon: Icons.history_rounded,
        onTap: () {
          setState(() => child = const AppointmentHistoryScreen());
        },
      ),
      // SidebarXItem(
      //   label: 'With Drawals',
      //   icon: Icons.attach_money,
      //   onTap: () {
      //     setState(() => child = const TotalBalanceScreen());
      //   },
      // ),
      SidebarXItem(
        label: 'Appointments',
        icon: Icons.access_time,
        onTap: () {
          setState(() => child = AppoinmentsScreen());
        },
      ),
      SidebarXItem(
        label: 'Settings',
        icon: Icons.settings,
        onTap: () =>
            navigatorPushAndRemoveUntil(context, const SettingsMenuScreen()),
      ),
      SidebarXItem(
          label: 'Log Out',
          icon: Icons.arrow_forward_ios,
          onTap: () {
            BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
            navigatorPushAndRemoveUntil(context, const LogInScreen());
          }),
    ];
  }

  Widget? child = const HomeScreen();
  String? profileImage;
  String? userName;
  @override
  void initState() {
    _items = _generateItems;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<GetProfileBloc, GetProfileStateBase>(
          listener: (context, state) {
            if (state is GetProfileLoaded) {
              var profile = state.serviceProviderProfileModel;
              profileImage = '${profile!.profilePicture}';
              userName = '${profile.user!.firstName} ${profile.user!.lastName}';
              setState(() {});
            }
          },
          child: SidebarX(
            controller: _controller,
            theme: SidebarXTheme(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: canvasColor,
                borderRadius: BorderRadius.circular(20),
              ),
              hoverColor: scaffoldBackgroundColor,
              textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
              selectedTextStyle: const TextStyle(color: Colors.white),
              itemTextPadding: const EdgeInsets.only(left: 30),
              selectedItemTextPadding: const EdgeInsets.only(left: 30),
              itemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: canvasColor),
              ),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: actionColor.withOpacity(0.37),
                ),
                gradient: const LinearGradient(
                  colors: [accentCanvasColor, canvasColor],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    blurRadius: 30,
                  )
                ],
              ),
              iconTheme: IconThemeData(
                color: Colors.white.withOpacity(0.7),
                size: 20,
              ),
              selectedIconTheme: const IconThemeData(
                color: Colors.white,
                size: 20,
              ),
            ),
            extendedTheme: const SidebarXTheme(
              width: 200,
              decoration: BoxDecoration(
                color: canvasColor,
              ),
            ),
            footerDivider: divider,
            headerBuilder: (context, extended) {
              return SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset('assets/images/avatar.png'),
                ),
              );
            },
            items: _items,
          ),
        ),
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset('assets/images/avatar.png'),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Icons.search,
          label: 'Search',
        ),
        const SidebarXItem(
          icon: Icons.people,
          label: 'People',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorites',
        ),
        const SidebarXItem(
          iconWidget: FlutterLogo(size: 20),
          label: 'Flutter',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
