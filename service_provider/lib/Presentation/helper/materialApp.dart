// ignore_for_file: file_names

import '../../Core/Routes/Routes.dart';
import '../Screens/Splash/SplashScreen.dart';
import 'Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMaterialApp {
  static myMeaterialApp() {
    return MaterialApp(
      home: GetMaterialApp(
        title: apptitle,
        debugShowCheckedModeBanner: true,
        theme: themeData,
        routes: routes,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
