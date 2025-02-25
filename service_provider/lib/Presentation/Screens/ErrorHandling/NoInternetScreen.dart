import 'package:flutter/material.dart';
import '../../../Core/Routes/Routes.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MySpaces.dart';
import '../../../Presentation/Screens/Splash/SplashScreen.dart';
import '../../../Presentation/Widgets/MyButton.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                    size: 130,
                    color: kPrimaryColor,
                  ),
                  Text(
                    'No Internet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              verticalSpacing20,
              verticalSpacing20,
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'No Internet Conntection, Make sure the Wi-Fi or mobile data is turned on, then try again',
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpacing20,
              verticalSpacing20,
              MyButton(
                onPressed: () {
                  navigatorPushAndRemoveUntil(context, const SplashScreen());
                },
                fontColor: kWhiteColor,
                bgColor: kPrimaryColor,
                buttonText: 'Refresh',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
