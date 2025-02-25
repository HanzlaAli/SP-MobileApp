// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

const personIconSvg = "assets/Images/profile-icon.svg";
const lockIconSvg = "assets/Images/lock-icon.svg";

const kPrimaryColor =Color(0xFF00CCCB);
const kBlueAccentColor =Color.fromARGB(255, 3, 138, 206);
const kSecondaryColor = Color(0xFF975B25);
const kWhiteColor = Colors.white;
const kMaximumWidgth = double.infinity;
const kWhiteColor70 = Colors.white70;
const kBlackColor = Colors.black;
const kBlackColor38 = Colors.black38;
const kBlackColor45 = Colors.black45;
const kTransparentColor = Colors.transparent;
const kCenterTextAlign = TextAlign.center;


final materialGreenColor =
    WidgetStateProperty.all<Color>(kPrimaryColor);
final materialPrimaryColor =
    WidgetStateProperty.all<Color>(kPrimaryColor);
final materialCheckBoxColor =
    WidgetStateProperty.all<Color>(Colors.white);
const kRedColor = Colors.red;
const kRedAccentColor = Colors.redAccent;
const kIndigoColor = Colors.indigo;
const kBlackColor12 = Colors.black12;
const kBlackColor26 = Colors.black26;

const appIconTag = "app-Icon";
final textFielderrorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kRedColor),
  borderRadius: BorderRadius.circular(8.0),
);
const byDefaultImage = Icon(
  Icons.person,
  color: kWhiteColor,
  size: 60,
);
final kErrorImage = SvgPicture.asset('assets/Images/serviceProvider-male.svg');
final kCircularProgressIndicator = SizedBox(
  height: Get.height * 0.7,
  // color: Colors.red,
  child: const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: CircularProgressIndicator(color: kBlueAccentColor),
      ),
    ],
  ),
);
final textFieldFocusBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
  borderRadius: BorderRadius.circular(8),
);
final textFieldEnabledBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent),
  borderRadius: BorderRadius.circular(8),
);
const verticalSpacing5 = SizedBox(
  height: 5,
);
const verticalSpacing10 = SizedBox(
  height: 10,
);
const verticalSpacing12 = SizedBox(
  height: 12,
);
const verticalSpacing16 = SizedBox(
  height: 16,
);
const verticalSpacing20 = SizedBox(
  height: 20,
);
const horizontalSpacing20 = SizedBox(
  width: 20,
);
const horizontalSpacing10 = SizedBox(
  width: 10,
);
const kRememberMeTextStyle = TextStyle(
    color: kPrimaryColor, fontSize: 13, fontWeight: FontWeight.w700);

const mainAxisSpaceBetween = MainAxisAlignment.spaceBetween;
