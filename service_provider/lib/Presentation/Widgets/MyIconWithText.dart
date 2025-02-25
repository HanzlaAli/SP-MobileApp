// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import '../helper/Constants/MyColors.dart';

class MyIconWithText extends StatelessWidget {
  MyIconWithText({Key? key, required this.text, this.onPressed, this.icon})
      : super(key: key);
  String text;
  Icon? icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: kBlackColor38),
        ),
        icon == null ? Container() : IconButton(onPressed: () {}, icon: icon!),
      ],
    );
  }
}
