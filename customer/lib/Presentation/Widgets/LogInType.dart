// ignore_for_file: must_be_immutable, file_names

import 'dart:ui';

import '../helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogInType extends StatelessWidget {
  const LogInType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.35,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kPrimaryColor,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: kWhiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _headerText(
                    context, 'I want to login as', 'Choose your account type'),
                MySelectorWidget(
                  text: 'A Client',
                  image: 'assets/Images/fever.svg',
                  onTap: () {},
                ),
                MySelectorWidget(
                  text: 'A Therapist',
                  image: 'assets/Images/serviceProvider-male.svg',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerText(BuildContext context, String firstText, String lastText) =>
      Container(
        // height: 150,
        padding: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Text(
            firstText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          verticalSpacing10,
          Text(
            lastText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
        ]),
      );
}

class MySelectorWidget extends StatelessWidget {
  MySelectorWidget({
    Key? key,
    required this.text,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  String text;
  String image;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      width: Get.width * 0.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kBlackColor38)),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset(
          image,
          width: 40,
        ),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_outlined),
      ),
    );
  }
}
