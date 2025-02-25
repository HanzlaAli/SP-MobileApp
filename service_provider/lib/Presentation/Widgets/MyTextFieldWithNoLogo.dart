// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import '../helper/Constants/MyColors.dart';
import '../helper/Constants/MyTextFieldsStyling.dart';
import '../helper/ReusedFunctions.dart';

class MyTextFieldWithNoLogo extends StatelessWidget {
  MyTextFieldWithNoLogo(
      {super.key,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.readOnly = false,
      this.textInputAction,
      this.focusNode,
      this.onFieldSubmitted,
      this.onTap,
      this.fillColor = Colors.black12,
      required this.textEditingController,
      this.width,
      this.textInputColor = kBlackColor45,
      required this.validator});
  String? hintText;
  bool readOnly;
  Color textInputColor;
  double? width;
  void Function(String)? onFieldSubmitted;
  bool obscureText = false;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  Function()? onTap;
  TextEditingController textEditingController;
  Color fillColor;
  @override
  Widget build(BuildContext context) {
    final mediaquerywidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: width ?? getWidth(mediaquerywidth),
          child: TextFormField(
            readOnly: readOnly,
            cursorColor: textInputColor,
            onTap: onTap,
            validator: validator,
            focusNode: focusNode,
            controller: textEditingController,
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
