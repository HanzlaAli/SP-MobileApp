// ignore_for_file: file_names

import '../../../Presentation/helper/Constants/MyColors.dart';
import 'package:flutter/material.dart';

final textFielderrorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kRedColor),
  borderRadius: BorderRadius.circular(8.0),
);
final textFieldFocusBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kTransparentColor, width: 1.0),
  borderRadius: BorderRadius.circular(8),
);
final textFieldEnabledBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kTransparentColor),
  borderRadius: BorderRadius.circular(8),
);
