// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import '../helper/Constants.dart';
import '../helper/ReusedFunctions.dart';

class MyTextFieldWithNoLogo extends StatelessWidget {
  MyTextFieldWithNoLogo(
      {Key? key,
      this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.textInputAction,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.width,
      this.onTap,
      this.fillColor = Colors.black12,
      required this.textEditingController,
      this.textInputColor = kBlackColor45,
      this.maxLines,
      this.readOnly = false,
      required this.validator})
      : super(key: key);
  String? hintText;
  double? width;
  Color textInputColor;
  void Function(String)? onFieldSubmitted;
  bool obscureText = false;
  String? Function(String?)? validator;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FocusNode? focusNode;
  Function()? onTap;
  TextEditingController textEditingController;
  void Function(String)? onChanged;
  bool readOnly;
  Color fillColor;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    final mediaquerywidth = MediaQuery.of(context).size.width;

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
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            focusNode: focusNode,
            maxLines: maxLines,
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
