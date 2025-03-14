import 'package:flutter/material.dart';
import '../../../../Data/Models/CustomerRequestModels/customer_request_service_model.dart';
import '../../../helper/Constants/MyColors.dart';
import 'customer_request_list_items.dart';

class ListItems extends StatelessWidget {
  ListItems({super.key, required this.model, required this.onTap});
  CustomerRequestServiceModel model;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: klightWhiteColor),
        child: Column(
          children: [
            Row(
              spacing: 5,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    '${model.user?.profilePicture}',
                  ),
                ),
                Column(
                  spacing: 3,
                  children: [
                    Text(
                      '${model.user?.firstName} ${model.user?.lastName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 4, bottom: 4, left: 5, right: 10),
                          margin: const EdgeInsets.only(
                              top: 2, bottom: 2, left: 10),
                          decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            spacing: 3,
                            children: [
                              const Icon(
                                Icons.phone,
                                color: kBlackColor,
                                size: 10,
                              ),
                              Text(
                                '${model.user?.phoneNumber}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor,
                                    fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomerServiceDetails(
                      text: model.title.toString(),
                      icon: Icons.handyman_outlined,
                    ),
                    CustomerServiceDetails(
                      text: model.description.toString(),
                      icon: Icons.description,
                    ),
                    const CustomerServiceDetails(
                      text: '4.9',
                      icon: Icons.star,
                      iconColor: kYellowColor,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    '\$ ${model.budget}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
