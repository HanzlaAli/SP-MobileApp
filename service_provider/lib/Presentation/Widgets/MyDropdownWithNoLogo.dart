// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyColors.dart';
import '../helper/Constants/MyTextFieldsStyling.dart';

class MyDropDownTextFieldwithNoLogo extends StatelessWidget {
  MyDropDownTextFieldwithNoLogo({
    super.key,
    this.focusNode,
    this.items,
    this.value,
    this.hintText,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillColor = Colors.black12,
    this.textInputColor = kBlackColor45,
    this.width,
    required this.validator,
  });

  Color textInputColor;
  String? hintText;
  double? width;
  void Function(String)? onFieldSubmitted;
  FocusNode? focusNode;
  String? Function(Object?)? validator;
  void Function(Object?)? onChanged;
  List<DropdownMenuItem<Object>>? items;
  Object? value;
  Color fillColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * 0.8,
      child: DropdownButtonFormField(
        value: value,
        validator: validator,
        borderRadius: BorderRadius.circular(20),
        focusNode: focusNode,
        style: TextStyle(color: textInputColor, fontSize: 12.4),
        icon: const Icon(Icons.arrow_drop_down_sharp),
        items: items,
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
        onChanged: onChanged,
      ),
    );
  }
}
