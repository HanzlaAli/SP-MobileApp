import 'package:flutter/material.dart';
import 'package:mended_soluctions/Presentation/helper/Constants/MyColors.dart';

class EmptyDataScreen extends StatelessWidget {
  EmptyDataScreen({required this.text, super.key});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Images/empty-img.png'),
          Text(
            text!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
