// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyColors.dart';

class MyAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  MyAppBarWidget({
    super.key,
    this.icon,
    required this.pageNo,
    this.text,
  });
  Widget? icon;
  String? text;
  String pageNo;
  
    @override
  Size get preferredSize =>  const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kBlackColor12,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                color: kBlackColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text != null
                  ? Text(
                      '$text',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  : Container(),
              Text(
                pageNo,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: kBlackColor26),
              )
            ],
          ),
          icon != null ? IconButton(onPressed: () {}, icon: icon!) : Container()
        ],
      ),
    );
  }
}
