// ignore_for_file: must_be_immutable
import 'package:customer/Presentation/Bloc/CustomerBookedServicesBloc/customer_booked_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Presentation/helper/Constants.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Presentation/Bloc/RequestForAppoinmentBloc/request_for_appoinment_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Data/Models/ServicesModels/GetCustomerBookedServices.dart';
import '../../Widgets/ServiceProviderSlotsWidget.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyDrawer.dart';

class CustomerBookedServicesScreen extends StatefulWidget {
  const CustomerBookedServicesScreen({super.key});

  @override
  State<CustomerBookedServicesScreen> createState() =>
      _CustomerBookedServicesScreenState();
}

class _CustomerBookedServicesScreenState
    extends State<CustomerBookedServicesScreen> {
  @override
  void initState() {
    BlocProvider.of<CustomerBookedServicesBloc>(context)
        .add(GetAllCustomerBookedServices());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);

    return BlocListener<RequestForAppoinmentBloc,
        RequestForAppoinmentStateBase>(
      listener: (context, state) {
        if (state is RequestForAppoinmentLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is RequestForAppoinmentSuccess) {
          Get.snackbar("Success", 'Request Sent!');
        } else if (state is RequestForAppoinmentError) {
          Get.snackbar("Opps", "Try Again");
        }
      },
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: MyAppBar(
          title: 'My Services',
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<CustomerBookedServicesBloc>(context)
                .add(GetAllCustomerBookedServices());
          },
          child: BlocBuilder<CustomerBookedServicesBloc,
              CustomerBookedServicesState>(
            builder: (context, state) {
              if (state is CustomerBookedServicesLoading) {
                return _shimmer(context);
              } else if (state is CustomerBookedServicesLoaded) {
                if (state.model!.length == 0) {
                  return EmptyDataScreen(text: 'No Booked Services');
                }
                return ListView.builder(
                    itemCount: state.model!.length,
                    itemBuilder: (context, rowindex) {
                      return Row(
                        children: List.generate(
                          columnCount,
                          (columnindex) {
                            final int index =
                                rowindex * columnCount + columnindex;

                            if (index >= state.model!.length) {
                              return Expanded(child: Container());
                            }
                            return Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MyWidget(model: state.model![index]),
                              ),
                            );
                          },
                        ),
                      );
                    });
              } else if (state is CustomerBookedServicesError) {
                return const InternalServerErrorScreen();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 140,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
            ),
            itemCount: 4,
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  MyWidget({
    Key? key,
    this.model,
  }) : super(key: key);
  GetCustomerBookedServiceModel? model;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(top: 15),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              // leading: GestureDetector(
              //   onTap: () => Get.to(const ServiceProviderProfileScreen()),
              //   child: CircleAvatar(
              //     radius: 30,
              //     child:
              //         SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
              //   ),
              // ),

              title: Text(
                model!.name ?? "",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model!.therapyName ?? ""),
                  Text('${model!.serviceProviderName}'),
                  Text(
                    '${model!.charges}\$  (${model!.numberOfTimesAvailable}) xTimes',
                    style: const TextStyle(color: kSecondaryColor),
                  ),
                ],
              ),
              trailing: Text(
                DateFormat('dd-MM-yyyy')
                    .format(DateTime.parse(model!.validTill!)),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 5,
                child: MyButton(
                  width: 120,
                  textSize: 15,
                  onPressed: () => Get.bottomSheet(ServiceProviderSlotsWidget(
                    firstTime: false,
                    serviceProviderId: model!.serviceProviderId!,
                    CustomerServiceId: model!.id!,
                  )),
                  fontColor: kWhiteColor,
                  bgColor: kBlueAccentColor,
                  buttonText: 'Book Now',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
