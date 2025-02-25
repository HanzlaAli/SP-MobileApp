import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
import '../../../Presentation/Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../../Data/Models/CheckOutModel/CheckOutModel.dart';
import '../../../Data/Models/ServicesModels/GetAllServicesModel.dart';
import '../../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Bloc/CartBloc/cart_bloc.dart';
import '../../Widgets/ServiceProviderSlotsWidget.dart';
import '../../Widgets/FilterBottomSheet.dart';
import '../../Widgets/MyButton.dart';
// ignore_for_file: must_be_immutable
import '../../helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Widgets/StripeBottomSheet.dart';
import '../Appoinments/GetAllAppoinments.dart';

class ServiceProviderProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  ServiceProviderProfileScreen({required this.model, Key? key}) : super(key: key);
  GetServiceProvidersModel model;
  @override
  State<ServiceProviderProfileScreen> createState() => _ServiceProviderProfileScreenState();
}

class _ServiceProviderProfileScreenState extends State<ServiceProviderProfileScreen> {
  final searchController = TextEditingController();
  TherapyTypeResponseModel? therapyTypeResponseModel;
  ScrollController? _scrollController;
  bool lastStatus = true;
  double height = 200;
  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  bool isNull = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartStateBase>(
      listener: (context, state) {
        if (state is CartLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is CartSucess) {
          Get.snackbar("Success", "Added!");

          navigatorPush(context, const AppoinmentsScreen());
        } else if (state is CartError) {
          Get.snackbar("Opps", "Try Again");
        }
      },
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [appBar()];
          },
          body: CustomScrollView(
            slivers: [
              _services(),
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return SliverAppBar(
        elevation: 0,
        backgroundColor: _isShrink ? kPrimaryColor : kWhiteColor,
        foregroundColor: _isShrink ? kWhiteColor : kBlackColor,
        pinned: true,
        expandedHeight: 220,
        flexibleSpace: _flexibleSpace(),
        leading: _isShrink
            ? Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        // errorBuilder: (BuildContext context, Object exception,
                        //     StackTrace? stackTrace) {
                        //   return byDefaultImage;
                        // },
                        image: NetworkImage(widget.model.profilePicture!),
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      )),
                ]),
              )
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              ),
        title: _isShrink
            ? null
            : const Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        actions: [
          isNull
              ? Container()
              : GestureDetector(
                  onTap: () {
                    if (isNull == false) {
                      Get.bottomSheet(FilterServices(
                        onDataReceived: (therapy) {
                          therapyTypeResponseModel = therapy;
                        },
                      ));
                    }
                  },
                  child: Icon(
                    Icons.filter_alt_rounded,
                    size: 30,
                    color: _isShrink ? kWhiteColor : kBlueAccentColor,
                  ),
                )
        ]);
  }

  Widget _flexibleSpace() {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      title: _isShrink
          ? Text(
              widget.model.fullName!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          : null,
      background: SafeArea(
        child: _serviceProviderInfo(widget.model.profilePicture!, widget.model.fullName!,
            widget.model.businessPhoneNumber!, widget.model.city!),
      ),
    );
  }

  Widget _services() {
    return BlocBuilder<GetAllServicesBloc, GetAllServicesStateBase>(
      builder: (context, state) {
        // if (state is GetAllServicesLoading) {
        //   return SliverList(
        //     delegate: SliverChildBuilderDelegate(childCount: 1,
        //         (BuildContext context, int rowindex) {
        //       return _shimmer(context);
        //     }),
        //   );
        // } else
        if (state is GetAllServicesLoaded) {
          var list = state.model!
              .where((x) =>
                  x.serviceProviderName!.toLowerCase() ==
                  widget.model.fullName!.toLowerCase())
              .toList();
          if (list.length == 0) {
            isNull = true;
            return SliverList(
              delegate: SliverChildBuilderDelegate(childCount: 1,
                  (BuildContext context, int rowindex) {
                return Container(
                    height: 400, child: EmptyDataScreen(text: 'No Services!'));
              }),
            );
          } else {
            final int columnCount = getCount(MediaQuery.of(context).size.width);

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: state.filteredList != null
                      ? (state.filteredList!.length / columnCount).ceil()
                      : (state.model!.length / columnCount).ceil(),
                  (BuildContext context, int rowindex) {
                return Row(
                  children: List.generate(
                    columnCount,
                    (columnindex) {
                      final int index = rowindex * columnCount + columnindex;

                      if (index >= list.length) {
                        return Expanded(child: Container());
                      }
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyCard(
                            therapyTypeResponseModel: therapyTypeResponseModel,
                            model: list[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            );
          }
        } else if (state is GetAllServicesError) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(childCount: 1,
                (BuildContext context, int rowindex) {
              return const InternalServerErrorScreen();
            }),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(childCount: 1,
              (BuildContext context, int rowindex) {
            return Container();
          }),
        );
      },
    );
  }

  Widget _serviceProviderInfo(String serviceProviderProfile, String serviceProviderName,
          String serviceProviderSpecialization, String serviceProviderAddress) =>
      Container(
        margin: const EdgeInsets.only(top: 15, left: 10),
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kBlueAccentColor),
              child: CircleAvatar(
                backgroundImage: NetworkImage(serviceProviderProfile),
                onBackgroundImageError: (exception, stackTrace) =>
                    SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
                radius: 50,
                backgroundColor: kBlueAccentColor,
                //  child: byDefaultImage,
              ),
            ),
            horizontalSpacing20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  serviceProviderName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(
                        top: 4, bottom: 4, left: 10, right: 10),
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      serviceProviderSpecialization,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: kBlackColor),
                    )),
                verticalSpacing10,
                Container(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 5, right: 10),
                  margin: const EdgeInsets.only(top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: kBlackColor,
                      ),
                      Text(
                        serviceProviderAddress,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: kBlackColor),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
}

class MyCard extends StatelessWidget {
  MyCard({
    Key? key,
    this.model,
    this.therapyTypeResponseModel,
  }) : super(key: key);
  GetAllServiceModel? model;
  DateTime? filterdate, fromDate, toDate;
  TherapyTypeResponseModel? therapyTypeResponseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
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
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model!.therapyName ?? ""),
                    Text('${model!.serviceProviderName}'),
                    Text(
                        '${model!.charges}\$  (${model!.numberOfTimesAvailable}) xTimes'),
                  ],
                ),
                trailing: Text(DateFormat('dd-MM-yyyy')
                    .format(DateTime.parse(model!.validTill!))),
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
                    textSize: 16,
                    onPressed: () {
                      Get.bottomSheet(ServiceProviderSlotsWidget(
                        firstTime: true,
                        serviceProviderId: model!.serviceProviderId,
                        price: model?.charges.toString(),
                        serviceId: model!.id,
                      ));
                    },
                    fontColor: kWhiteColor,
                    bgColor: kBlueAccentColor,
                    buttonText: 'Buy Now',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceProviderEducationWidget extends StatelessWidget {
  ServiceProviderEducationWidget({
    Key? key,
    required this.serviceProviderEducation,
  }) : super(key: key);
  String serviceProviderEducation;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.location_city,
        color: kPrimaryColor,
      ),
      title: Text(
        serviceProviderEducation,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }
}

class SpecialitiesWidget extends StatelessWidget {
  SpecialitiesWidget({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: kPrimaryColor),
      padding: const EdgeInsets.all(7),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, color: kWhiteColor),
      ),
    );
  }
}
