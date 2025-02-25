// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyColors.dart';

const appIconTag = "app-Icon";
const apptitle = 'Mended Solutions Portal';
const kMaximumWidgth = double.infinity;
final themeData = ThemeData(fontFamily: "OpenSans");

const kRememberMeTextStyle = TextStyle(
    color: kPrimaryColor, fontSize: 13, fontWeight: FontWeight.w700);

const servicesWidgetRadius = BorderRadius.only(
  topLeft: Radius.circular(20),
  topRight: Radius.circular(20),
);
final kCircularProgressIndicator = SizedBox(
  height: Get.height * 0.7,
  // color: Colors.red,
  child: const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: CircularProgressIndicator(color: kPrimaryColor),
      ),
    ],
  ),
);
