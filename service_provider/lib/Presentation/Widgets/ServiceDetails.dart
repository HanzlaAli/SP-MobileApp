// ignore_for_file: must_be_immutable, library_private_types_in_public_api, file_names
import 'dart:ui';
import '../../Presentation/helper/ReusedFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyColors.dart';
import '../helper/Constants/MySpaces.dart';
import '../../Data/Models/ServicesModels/GetServiceModel.dart';

class ServiceDetail extends StatefulWidget {
  GetServicesModel? model;
  ServiceDetail({super.key, this.model});
  @override
  _ServiceDetailState createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                margin: const EdgeInsets.only(
                    top: 40, bottom: 20, left: 10, right: 10),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: Get.width,
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.model!.name}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      verticalSpacing20,
                      Text(
                        '${widget.model!.therapyName}',
                      ),
                      verticalSpacing20,
                      Text(
                        '${widget.model!.charges}\$',
                        style: const TextStyle(
                            color: kPrimaryColor, fontSize: 15),
                      ),
                      verticalSpacing20,
                      Text(
                        '${widget.model!.numberOfTimesAvailable}x',
                        style: const TextStyle(
                            fontSize: 15, color: kPrimaryColor),
                      ),
                      verticalSpacing20,
                      Text(
                        dateTimetoDateConverter(
                            DateTime.parse(widget.model!.validTill!)),
                        style: const TextStyle(
                            fontSize: 15, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
