// ignore_for_file: must_be_immutable, file_names
import '../../Presentation/Widgets/MyTextButton.dart';
import 'package:flutter/material.dart';

class MyButtonWithText extends StatelessWidget {
  MyButtonWithText(
      {Key? key,
      required this.text,
      required this.buttonText,
      required this.onPressed,
      required this.buttonTextColor,
      required this.textColor})
      : super(key: key);
  String text;
  String buttonText;
  Color textColor;
  Color buttonTextColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: textColor),
        ),
        MyTextButton(
          text: buttonText,
          color: buttonTextColor,
          fontWeight: FontWeight.w700,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
