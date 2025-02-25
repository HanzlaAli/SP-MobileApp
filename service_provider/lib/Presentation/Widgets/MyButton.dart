// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/ThemeBloc/theme_bloc.dart';
import '../helper/Constants/MyColors.dart';
import '../helper/ReusedFunctions.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    this.buttonText,
    this.bgColor = kPrimaryColor,
    required this.onPressed,
    required this.fontColor,
    this.width,
    this.textSize = 20.0,
  });
  String? buttonText;
  Color bgColor;
  double textSize;
  double? width;
  Color fontColor;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final mediaquerywidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themestate) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              elevation: 8,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Ink(
            decoration: BoxDecoration(
                color: themestate is DarkThemeState ? kBlackColor : bgColor,
                //  gradient: LinearGradient(colors: bgColor),
                borderRadius: BorderRadius.circular(8)),
            child: Container(
              width: width ?? getWidth(mediaquerywidth),
              height: 50,
              alignment: Alignment.center,
              child: Text(
                '$buttonText',
                style: TextStyle(
                  fontSize: textSize,
                  color: fontColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
