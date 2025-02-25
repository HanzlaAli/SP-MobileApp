// ignore_for_file: must_be_immutable, file_names
import '../../Presentation/helper/Constants/MySpaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/Constants/MyColors.dart';
import '../helper/Constants/MyTextFieldsStyling.dart';
import '../helper/ReusedFunctions.dart';

class MyDropDownTextField extends StatelessWidget {
  MyDropDownTextField(
      {Key? key,
      this.pictureIcon,
      this.focusNode,
      this.items,
      this.value,
      this.icon,
      this.onTap,
      this.hintText,
      this.onChanged,
      this.onFieldSubmitted,
      this.fillColor = kBlackColor12,
      this.textInputColor = kBlackColor45,
      this.width,
      required this.validator})
      : super(key: key);
  String? pictureIcon;
  Color textInputColor;
  double? width;
  void Function()? onTap;
  IconData? icon;
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
          width: width ?? getWidth(MediaQuery.of(context).size.width),
          child: DropdownButtonFormField(
            onTap: onTap,
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
                        )),
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
