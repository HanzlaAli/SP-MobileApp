// ignore_for_file: file_names

import 'dart:ui' show FontWeight, ImageFilter, Radius, TextAlign;
import '../helper/Constants.dart';
import '../../Presentation/Screens/User/LogIn/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Core/Routes/Routes.dart';
import 'MyButton.dart';

class RegistrationSuccessFull extends StatefulWidget {
  const RegistrationSuccessFull({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessFull> createState() =>
      _RegistrationSuccessFullState();
}

class _RegistrationSuccessFullState extends State<RegistrationSuccessFull> {
  bool checkBoxOnchanged = false;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.7,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kPrimaryColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/Images/Registration-Success.svg',
                      width: 120),
                  verticalSpacing20,
                  verticalSpacing10,
                  const Text(
                    'Your registration has been successful',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor),
                  ),
                  verticalSpacing10,
                  const Text(
                    '''
We are completing a background check and
 verifying your license information. Once
everything clears, we'll send you email and
app notification. Your card will not be charged
until your verification is complete.
''',
                    textAlign: TextAlign.center,
                  ),
                  MyButton(
                      bgColor: kPrimaryColor,
                      fontColor: kWhiteColor,
                      textSize: 20,
                      width: MediaQuery.of(context).size.width * 0.8,
                      onPressed: () => navigatorPush(context, const LogInScreen()),
                      buttonText: 'Get Started'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
