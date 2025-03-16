import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mended_soluctions/Presentation/Screens/Chat/ChatHead.dart';
import 'package:mended_soluctions/Presentation/Screens/Home/widgets/home_app_bar.dart';
import 'package:mended_soluctions/Presentation/helper/Constants/MyColors.dart';
import '../../../../Data/Models/AppoinmentModels/GetAppoinmentRequestModel.dart';
import '../../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../Bloc/GetServiceProviderAppoinments/get_serviceProvider_appoinments_bloc.dart';
import '../../Bloc/TransactionBloc/transaction_bloc.dart';
import '../Appoinments/GetAllAppoinments.dart';
import '../CustomerRequests/customer_request.dart';
import '../Services/services_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getItems();
    super.initState();
  }

  _getItems() {
    BlocProvider.of<TransactionBloc>(context)
        .add(GetServiceProviderCashEvent());
    
    BlocProvider.of<GetServiceProviderAppoinmentsBloc>(context).add(
      GetServiceProviderAppoinments(
        model: GetBookedAppoinmentRequestModel(
          fromDate: DateTime.now().toIso8601String(),
          email: "",
          toDate: DateTime.now().toIso8601String(),
        ),
      ),
    );

    BlocProvider.of<GetProfileBloc>(context)
        .add(GetServiceProviderProfileEvent());
  }

  int _currentIndex = 0;

  // List of screens for the bottom navigation bar
  final List<Widget> _screens = [
    const CustomerRequestScreen(),
    const ServiceScreen(),
    const ChatHeadScreen(),
    AppoinmentsScreen()
  ];

  final _bottomNavigationBarItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Jobs',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.medical_services_rounded),
      label: 'Services',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.messenger_rounded),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month),
      label: 'Appointments',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: kWhiteColor,
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the selected screen
            });
          },
          items: _bottomNavigationBarItems),
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
