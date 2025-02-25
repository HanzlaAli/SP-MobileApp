// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/Constants.dart';
import '../helper/ReusedFunctions.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {super.key,
      this.hintText,
      this.pictureIcon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.textInputAction,
      this.onChanged,
      this.focusNode,
      this.icon,
      this.width,
      this.onFieldSubmitted,
      this.fillColor = Colors.black12,
      required this.textEditingController,
      this.textInputColor = kBlackColor45,
      this.enabled,
      required this.validator});
  double? width;
  String? hintText;
  Widget? suffixIcon;
  String? pictureIcon;
  Color textInputColor;
  bool? enabled;
  IconData? icon;
  void Function(String)? onFieldSubmitted;
  bool obscureText = false;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  void Function(String)? onChanged;
  TextEditingController textEditingController;
  Color fillColor;
  @override
  Widget build(BuildContext context) {
    final mediaquerywidth = MediaQuery.of(context).size.width;
    //final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing5,
        SizedBox(
          width: width ?? getWidth(mediaquerywidth),
          child: TextFormField(
            cursorColor: textInputColor,
            validator: validator,
            focusNode: focusNode,
            onChanged: onChanged,
            controller: textEditingController,
            enabled: enabled,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText,
            onFieldSubmitted: onFieldSubmitted,
            style: TextStyle(
              color: textInputColor,
            ),
            decoration: InputDecoration(
              fillColor: fillColor,
              hintText: hintText,
              hintStyle: TextStyle(color: textInputColor),
              suffixIcon: suffixIcon,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: icon != null
                    ? Icon(
                        icon,
                        color: textInputColor,
                        size: 23,
                      )
                    : SvgPicture.asset(
                        pictureIcon!,
                        color: textInputColor,
                      ),
              ),
              errorBorder: textFielderrorBorder,
              focusedErrorBorder: textFielderrorBorder,
              focusedBorder: textFieldFocusBorder,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: textFieldEnabledBorder,
              filled: true,
            ),
          ),
        ),
      ],
    );
  }


}
