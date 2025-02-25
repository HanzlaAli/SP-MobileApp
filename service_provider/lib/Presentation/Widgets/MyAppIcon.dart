// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';

class MyAppIcon extends StatelessWidget {
  MyAppIcon({
    Key? key,
    required this.size,
  }) : super(key: key);
  double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Images/AppLogo.png',
      height: size,
    );

    // Text(
    //   '',
    //   style: TextStyle(
    //       fontSize: fontSize,
    //       color: kSecondaryColor,
    //       fontWeight: FontWeight.w800),
    //   textAlign: kCenterTextAlign,
    // );
  }
}
