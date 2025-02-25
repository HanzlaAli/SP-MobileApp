// ignore_for_file: must_be_immutable, file_names
import '../helper/Constants.dart';
import 'package:flutter/material.dart';
import '../helper/ReusedFunctions.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    this.buttonText,
    this.child,
    this.bgColor = kBlueAccentColor,
    required this.onPressed,
    required this.fontColor,
    this.borderRadius = 8.0,
    this.width,
    this.textSize = 20.0,
  });
  String? buttonText;
  Widget? child;
  Color bgColor;
  double textSize;
  double? width;
  Color fontColor;
  double? borderRadius;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final mediaquerywidth = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 8,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!))),
      child: Ink(
        decoration: BoxDecoration(
            color: bgColor,
            //  gradient: LinearGradient(colors: bgColor),
            borderRadius: BorderRadius.circular(borderRadius!)),
        child: Container(
          width: width ?? getWidth(mediaquerywidth),
          height: 50,
          alignment: Alignment.center,
          child: child ??
              Text(
                '$buttonText',
                style: TextStyle(
                  fontSize: textSize,
                  color: fontColor,
                ),
              ),
        ),
      ),
    );
  }
}
