import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_nerdzlab/carousel_nerdzlab.dart';
import 'package:flutter/material.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyButton.dart';
import 'package:mended_soluctions/Presentation/Widgets/my_network_images.dart';
import 'package:mended_soluctions/Presentation/helper/Constants/MySpaces.dart';
import '../../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../Widgets/MyAppBar.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/ReusedFunctions.dart';
import 'widgets/customer_request_list_items.dart';

class CustomerRequestDetailScreen extends StatelessWidget {
  final CustomerRequestServiceModel model;

  const CustomerRequestDetailScreen({
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
                      Row(
                        children: [
                          Text(
                            '${model.title}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBlackColor,
                                fontSize: 20),
                          ),
                          Text(
                            ' - ${model.budget}\$',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kBlackColor38,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat_bubble_rounded),
                        color: kSecondaryColor,
                        onPressed: () {},
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
                      const CustomerServiceDetails(
                        text: '4.9',
                        icon: Icons.star,
                        iconColor: kYellowColor,
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyButton(
            onPressed: () {},
            width: MediaQuery.of(context).size.width * 0.8,
            bgColor: kPrimaryColor,
            fontColor: kWhiteColor,
            buttonText: 'Book Now',
          ),
        ],
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
                '${model.user?.firstName} ${model.user?.lastName}',
              ),
              _buildPhoneNoRow(
                'Phone',
                '${model.user?.phoneNumber}',
              ),
              _buildCustomerDetailsRow(
                'Email',
                '${model.user?.email}',
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
