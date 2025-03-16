// ignore_for_file: must_be_immutable, library_private_types_in_public_api, file_names
import 'dart:ui';
import '../../../Widgets/MyAppBar.dart';
import '../../../helper/ReusedFunctions.dart';
import 'package:flutter/material.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../../helper/Constants/MySpaces.dart';
import '../../../../Data/Models/ServicesModels/GetServiceModel.dart';
import 'package:carousel_nerdzlab/carousel_nerdzlab.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyButton.dart';
import 'package:mended_soluctions/Presentation/Widgets/my_network_images.dart';

class ServiceDetail extends StatelessWidget {
  final GetServicesModel model;

  const ServiceDetail({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: MyAppBar(
        title: "Customer Request Details",
        isDrawer: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: CenteredPageView.builder(
                itemCount: model.images?.length ?? 0,
                showIndicator: false,
                indicatorStyle: const IndicatorStyle(
                    indicatorWidth: 100, unselectedSize: Size(8, 8)),
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                      color: kBlackColor12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: model.images != null
                        ? MyNetworkImage(imagePath: model.images![index])
                        : const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 40,
                              color: kBlackColor38,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${model.name}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kBlackColor,
                            fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          spacing: 5,
                          children: [
                            Text(
                              '\$ ${model.charges}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if ((model.discount ?? 0) > 0) ...[
                              Text(
                                '\$ ${model.charges}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor45,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                '\$ ${(model.charges! - model.discount!).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, left: 5, right: 10),
                        decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          spacing: 3,
                          children: [
                            const Icon(
                              Icons.home_repair_service_rounded,
                              color: kBlackColor,
                              size: 10,
                            ),
                            Text(
                              '${model.serviceType?.name}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBlackColor,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing10,
                  _buildDescriptionCard(),
                  verticalSpacing10,
                  _buildCustomerDetails(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildCustomerDetails() {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: const Text('Customer Details'),
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            spacing: 10,
            children: [
              _buildCustomerDetailsRow(
                'Name',
                '${model.serviceProvider?.firstName} ${model.serviceProvider?.lastName}',
              ),
              _buildPhoneNoRow(
                'Phone',
                '${model.serviceProvider?.phoneNumber}',
              ),
              _buildCustomerDetailsRow(
                'Email',
                '${model.serviceProvider?.email}',
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildCustomerDetailsRow(String key, String value) {
    return Row(
      children: [
        Text(
          '$key: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value)
      ],
    );
  }

  _buildPhoneNoRow(String key, String phoneNo) {
    return Row(
      children: [
        Text(
          '$key: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () => launchDialPad(phoneNo),
          child: Text(phoneNo),
        )
      ],
    );
  }

  _buildDescriptionCard() {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      title: const Text('Description'),
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            model.description.toString(),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
