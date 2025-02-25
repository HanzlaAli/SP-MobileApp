import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../Screens/Splash/SplashScreen.dart';
import '../../Core/Routes/Routes.dart';

class MyMaterialApp {
  static myMaterialApp() {
    return GetMaterialApp(
      title: 'Mended Solutions',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(fontFamily: "OpenSans"),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
