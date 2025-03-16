import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helper/Constants/MyIcons.dart';

class PickImageWidget extends StatelessWidget {
  PickImageWidget({
    required this.text,
    required this.onTap,
    this.image,
    this.path = "",
    Key? key,
  }) : super(key: key);
  String text;
  XFile? image;
  String path;

  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        // ignore: sort_child_properties_last
        child: image != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    onError: (exception, stackTrace) => byDefaultImage,
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(image!.path),
                    ),
                  ),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      onError: (exception, stackTrace) => byDefaultImage,
                      fit: BoxFit.fill,
                      image: NetworkImage(path)),
                ),
              ),
        width: Get.width * 0.8,
      ),
    );
  }
}
