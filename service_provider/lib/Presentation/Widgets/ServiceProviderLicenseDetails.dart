// ignore_for_file: must_be_immutable, file_names
import 'dart:ui';
import 'package:flutter/material.dart';
import '../helper/Constants/MySpaces.dart';
import '../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';

class ServiceProviderLicenseDetails extends StatelessWidget {
  ServiceProviderLicense serviceProviderLicense;
  ServiceProviderLicenseDetails({super.key, required this.serviceProviderLicense});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CostumImageFrame(image: serviceProviderLicense.frontImage),
                      verticalSpacing20,
                      CostumImageFrame(image: serviceProviderLicense.backImage),
                      verticalSpacing20,
                      CostumText(
                          value: 'Board: ', text: '${serviceProviderLicense.board}'),
                      verticalSpacing20,
                      CostumText(
                          value: 'Number: ', text: '${serviceProviderLicense.number}'),
                      verticalSpacing20,
                      CostumText(
                          value: 'Issue Date: ',
                          text: '${serviceProviderLicense.issueDate}'),
                      verticalSpacing20,
                      CostumText(
                          value: 'Expiry Date: ',
                          text: '${serviceProviderLicense.expiryDate}'),
                      verticalSpacing20,
                      CostumText(
                          value: 'Type: ',
                          text: '${serviceProviderLicense.licenseType!.name}'),
                      verticalSpacing20,
                      CostumText(
                          value: 'Expiry Date: ',
                          text: '${serviceProviderLicense.expiryDate}'),
                      verticalSpacing20,
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class CostumText extends StatelessWidget {
  CostumText({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);
  String? text;
  String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200,
              child: Text(
                text!,
                softWrap: true,
              ),
            ),
          ],
        ));
  }
}

class CostumImageFrame extends StatelessWidget {
  CostumImageFrame({
    Key? key,
    required this.image,
  }) : super(key: key);

  String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            image!,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
