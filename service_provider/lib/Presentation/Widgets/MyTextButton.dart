// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.fontSize,
      this.color,
      this.fontWeight});
  String? text;
  Color? color;
  FontWeight? fontWeight;
  double? fontSize;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
              color: color, fontWeight: fontWeight, fontSize: fontSize),
        ));
  }
}
