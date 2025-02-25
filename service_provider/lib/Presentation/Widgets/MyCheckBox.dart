// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyColors.dart';

class MyCheckBox extends StatefulWidget {
  MyCheckBox({
    Key? key,
    required this.onNoChanged,
    required this.onYesChanged,
    this.onNoValue,
    this.text,
    this.onYesValue,
  }) : super(key: key);
  void Function(bool?)? onYesChanged;
  void Function(bool?)? onNoChanged;
  bool? onYesValue;
  bool? onNoValue;
  String? text;
  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                fillColor: materialGreenColor,
                checkColor: kWhiteColor,
                value: widget.onYesValue,
                onChanged: widget.onYesChanged,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Text(
                'Yes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Checkbox(
                fillColor: materialGreenColor,
                checkColor: kWhiteColor,
                value: widget.onNoValue,
                onChanged: widget.onNoChanged,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              const Text(
                'No',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
