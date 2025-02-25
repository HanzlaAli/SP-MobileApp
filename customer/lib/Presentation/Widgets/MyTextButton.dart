// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  MyTextButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.fontWeight})
      : super(key: key);
  String? text;
  Color? color;
  FontWeight? fontWeight;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(color: color, fontWeight: fontWeight),
        ));
  }
}
