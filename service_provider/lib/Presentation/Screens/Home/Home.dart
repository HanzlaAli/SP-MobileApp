import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mended_soluctions/Presentation/Screens/Home/order_history.dart';
import 'package:mended_soluctions/Presentation/helper/Constants/MyColors.dart';
import '../../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Bloc/GetServiceProviderAppoinments/get_serviceProvider_appoinments_bloc.dart';
import '../../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../Bloc/TransactionBloc/transaction_bloc.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyDrawer.dart';
import '../CustomerRequests/customer_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<TransactionBloc>(context)
        .add(GetServiceProviderCashEvent());
    BlocProvider.of<GetServiceProviderAppoinmentsBloc>(context)
        .add(GetServiceProviderAppoinments(
            model: GetBookedAppoinmentRequestModel(
      fromDate: DateTime.now().toIso8601String(),
      email: "",
      toDate: DateTime.now().toIso8601String(),
    )));

    BlocProvider.of<GetProfileBloc>(context)
        .add(GetServiceProviderProfileEvent());
    super.initState();
  }

  int _currentIndex = 0;

  // List of screens for the bottom navigation bar
  final List<Widget> _screens = [
    const CustomerRequestScreen(),
    const OrderHistory(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themestate) {
        return Scaffold(
          appBar: MyAppBar(
            title: 'History',
            isHome: true,
            isDrawer: true,
          ),
          drawer: const MyDrawer(),
          backgroundColor: kWhiteColor,
          body: _screens[_currentIndex], // Display the selected screen
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index; // Update the selected screen
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
            ],
          ),
        );
      },
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage:
              AssetImage('assets/user_avatar.png'), // Replace with user image
        ),
        title: const Text('Service Request Title'),
        subtitle: const Text('Description of the service request...'),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to post details screen
        },
      ),
    );
  }
}
