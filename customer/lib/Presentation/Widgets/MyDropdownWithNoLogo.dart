// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/Constants.dart';
import '../helper/ReusedFunctions.dart';

class MyDropDownTextFieldwithNoLogo extends StatelessWidget {
  MyDropDownTextFieldwithNoLogo(
      {Key? key,
      this.focusNode,
      this.items,
      this.value,
      this.hintText,
      this.onChanged,
      this.onFieldSubmitted,
      this.fillColor = Colors.black12,
      this.textInputColor = kBlackColor45,
      required this.validator})
      : super(key: key);
  Color textInputColor;
  String? hintText;
  void Function(String)? onFieldSubmitted;
  FocusNode? focusNode;
  String? Function(Object?)? validator;
  void Function(Object?)? onChanged;
  List<DropdownMenuItem<Object>>? items;
  Object? value;
  Color fillColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing5,
        SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DropdownButtonFormField(
            validator: validator,
            borderRadius: BorderRadius.circular(20),
            focusNode: focusNode,
            style: TextStyle(
              color: textInputColor,
            ),
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
        ),
      ],
    );
  }
}
