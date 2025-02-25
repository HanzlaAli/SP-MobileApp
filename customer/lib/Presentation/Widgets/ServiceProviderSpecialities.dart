// ignore_for_file: must_be_immutable, file_names

import 'dart:ui';
import '../helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceProviderSpecialities extends StatefulWidget {
  const ServiceProviderSpecialities({Key? key}) : super(key: key);

  @override
  State<ServiceProviderSpecialities> createState() => _ServiceProviderSpecialitiesState();
}

class _ServiceProviderSpecialitiesState extends State<ServiceProviderSpecialities> {
  bool checkBoxOnchanged = false;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.6,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kPrimaryColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _headerText(context, 'Select your Specialities'),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Anexity',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Depression',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Trauma',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'RelationShips',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Psychology',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Marriage/Couple Counseling',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Anger Managment',
                  ),
                  Specialities(
                    checkBoxOnchanged: checkBoxOnchanged,
                    text: 'Sex and Sexuality',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerText(BuildContext context, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.arrow_drop_down_sharp, color: kBlackColor38)
        ],
      );
}

class Specialities extends StatefulWidget {
  Specialities({Key? key, required this.checkBoxOnchanged, required this.text})
      : super(key: key);
  bool checkBoxOnchanged = false;
  String text;
  @override
  State<Specialities> createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.checkBoxOnchanged = !widget.checkBoxOnchanged;
        });
      },
      leading: Text(
        widget.text,
        style: const TextStyle(
            color: kBlackColor, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      trailing: Checkbox(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: widget.checkBoxOnchanged,
        onChanged: (check) {
          setState(() {
            widget.checkBoxOnchanged = check!;
          });
        },
        fillColor: materialGreenColor,
        checkColor: kWhiteColor,
      ),
    );
  }
}
