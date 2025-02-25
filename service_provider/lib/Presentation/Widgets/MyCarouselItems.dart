// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyAlignments.dart';
import '../helper/Constants/MyColors.dart';
import '../helper/Constants/MySpaces.dart';

class MyCarouselItems extends StatelessWidget {
  MyCarouselItems(
      {Key? key,
      required this.firstText,
      required this.lastText,
      required this.image})
      : super(key: key);
  String firstText;
  String lastText;
  String image;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _appIcon(),
            _headerText(context, firstText, lastText),
            verticalSpacing20,
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: SvgPicture.asset(
                image,
                width: Get.width * 0.5,
              ),
            ),
          ],
        ));
  }

  Widget _appIcon() => const Text(
        'MENDED Solutions',
        style: TextStyle(
            fontSize: 30, color: kSecondaryColor, fontWeight: FontWeight.w800),
        textAlign: kCenterTextAlign,
      );
  Widget _headerText(BuildContext context, String firstText, String lastText) =>
      Container(
        // height: 150,
        padding: const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Text(
            firstText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          verticalSpacing10,
          Text(
            lastText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
        ]),
      );
}
