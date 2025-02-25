import 'package:carousel_slider/carousel_slider.dart';
import '../../helper/Constants.dart';
import '../../../Presentation/Controllers/OnBoardingController.dart';
import '../../../Presentation/Screens/User/LogIn/LogIn.dart';
import '../../../Presentation/Widgets/MyButton.dart';
import 'package:flutter/material.dart';
import '../../../Core/Routes/Routes.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/on-boarding';
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingController onBoardingScreenController = OnBoardingController();
  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _bottomColor(),
          _carousel(),
          _buttons(),
        ],
      ),
    );
  }

  Widget _carousel() => Container(
        height: MediaQuery.of(context).size.height * 0.87,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: onBoardingScreenController.list.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.75,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  })),
              itemBuilder: ((context, index, realIndex) {
                return onBoardingScreenController.list[index];
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: onBoardingScreenController.list.map((url) {
                int index = onBoardingScreenController.list.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPos == index
                        ? kPrimaryColor
                        : kBlackColor38,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
  Widget _bottomColor() => Container(
        width: double.infinity,
        color: kPrimaryColor,
      );
  Widget _buttons() => Positioned(
        bottom: 70,
        left: 40,
        child: Column(
          children: [
            MyButton(
                bgColor: kBlueAccentColor,
                buttonText: 'Let\'s Get Started',
                fontColor: kWhiteColor,
                onPressed: () =>
                    navigatorPushAndRemoveUntil(context, const LogInScreen())),
            verticalSpacing10,
          ],
        ),
      );
}
