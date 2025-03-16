import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../Data/Models/ServicesModels/DeleteServicesModel.dart';
import '../../../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../../Bloc/ServicesBloc/services_bloc.dart';
import '../../../Widgets/my_network_images.dart';
import '../../../helper/Constants/MyColors.dart';
import '../add_service_screen.dart';
import 'service_text_items.dart';

class ServiceListItem extends StatelessWidget {
  ServiceListItem({super.key, required this.model, required this.onTap});
  GetServicesModel model;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Container(
                          color: Colors.white,
                          child: MyNetworkImage(
                            imagePath:
                                '${model.images != null ? model.images?.first : ''}',
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      spacing: 3,
                      children: [
                        Text(
                          '${model.name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        Row(
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
                                    Icons.home_repair_service_rounded,
                                    color: kBlackColor,
                                    size: 10,
                                  ),
                                  Text(
                                    '${model.serviceType?.name}',
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
                  children: [
                    GestureDetector(
                      onTap: () => _onEditPopUp(context, model),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _onDeletePopUp(context, model.id ?? 0),
                      child: const Icon(
                        Icons.delete,
                        color: kRedColor,
                      ),
                    ),
                  ],
                )
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
                    ServiceTextDetails(
                      text: model.description.toString(),
                      icon: Icons.handyman_outlined,
                    ),
                    ServiceTextDetails(
                      text: model.description.toString(),
                      icon: Icons.description,
                    ),
                    const ServiceTextDetails(
                      text: '4.9',
                      icon: Icons.star,
                      iconColor: kYellowColor,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    spacing: 5,
                    children: [
                      Text(
                        '\$ ${model.discount ?? model.charges}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${model.charges}\$',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kBlackColor45,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _onDeletePopUp(BuildContext context, int id) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kWhiteColor,
            title: const Text(
              "Confirm",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            content: const Text(
              "Are you sure you want to delete this item?",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  BlocProvider.of<ServicesBloc>(context).add(
                      DeleteService(model: DeleteServiceModel(serviceId: id)));
                  Navigator.pop(context);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'No',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            ],
          );
        },
      );

  void _onEditPopUp(BuildContext context, GetServicesModel model) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kWhiteColor,
            title: const Text(
              "Confirm",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            content: const Text(
              "Are you sure you want edit this Item",
              style: TextStyle(
                color: kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  Navigator.pop(context);
                  Get.bottomSheet(AddServices(
                    model: model,
                  ));
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'No',
                  style: TextStyle(color: kWhiteColor),
                ),
              ),
            ],
          );
        },
      );
}
