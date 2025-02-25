// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/Screens/Appoinments/GetAllAppoinments.dart';
import '../../../Presentation/helper/Constants.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Presentation/Bloc/CartBloc/cart_bloc.dart';

import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Presentation/Widgets/FilterBottomSheet.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Presentation/Widgets/MyDrawer.dart';
import '../../../Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Data/Models/ServicesModels/GetAllServicesModel.dart';
import '../../../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
import '../../Widgets/ServiceProviderSlotsWidget.dart';
import '../../Widgets/MyButton.dart';
import '../ServiceProvider/ServiceProviderScreen.dart';

class ServicesScreen extends StatefulWidget {
  static const routeName = '/service';
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    BlocProvider.of<GetAllServicesBloc>(context).add(GetAllServices());

    super.initState();
  }

  TherapyTypeResponseModel? therapyTypeResponseModel;

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: MyAppBar(title: 'Services'),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GetAllServicesBloc>(context).add(GetAllServices());
        },
        child: BlocListener<CartBloc, CartStateBase>(
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
          child: BlocBuilder<GetAllServicesBloc, GetAllServicesStateBase>(
            builder: (context, state) {
              if (state is GetAllServicesLoading) {
                return _shimmer(context);
              } else if (state is GetAllServicesLoaded) {
                if (state.filteredList?.length == 0 &&
                    state.model?.length == 0) {
                  return EmptyDataScreen(text: 'No Services');
                } else {
                  return Column(
                    children: [
                      _filter(state.model),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.filteredList != null
                              ? (state.filteredList!.length / columnCount)
                                  .ceil()
                              : (state.model!.length / columnCount).ceil(),
                          itemBuilder: (context, rowindex) {
                            return Row(
                              children: List.generate(
                                columnCount,
                                (columnindex) {
                                  final int index =
                                      rowindex * columnCount + columnindex;
                                  var val = state.filteredList != null
                                      ? state.filteredList!.length
                                      : state.model!.length;
                                  if (index >= val) {
                                    return Expanded(child: Container());
                                  }
                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MyCard(
                                          therapyTypeResponseModel:
                                              therapyTypeResponseModel,
                                          model: state.filteredList == null
                                              ? state.model![index]
                                              : state.filteredList![index]),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              } else if (state is GetAllServicesError) {
                return const InternalServerErrorScreen();
              }
              return Container();
            },
          ),
       
        ),
      ),
    );
  }

  Padding _filter(var model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyTextFieldWithNoLogo(
              width: (kIsWeb
                  ? MediaQuery.of(context).size.width < 800
                      ? 300
                      : (MediaQuery.of(context).size.width * 0.85)
                  : (MediaQuery.of(context).size.width * 0.8)),
              onFieldSubmitted: (val) {},
              onChanged: (val) {
                BlocProvider.of<GetAllServicesBloc>(context)
                    .add(SearchService(val: val, model: model));
              },
              textEditingController: searchController,
              hintText: 'Search',
              validator: (val) {
                if (val!.isEmpty) {
                  return "";
                } else {
                  return null;
                }
              }),
          GestureDetector(
            onTap: () => Get.bottomSheet(FilterServices(
              onDataReceived: (therapy) {
                therapyTypeResponseModel = therapy;
              },
            )),
            child: const Icon(
              Icons.filter_alt_rounded,
              size: 30,
              color: kBlueAccentColor,
            ),
          )
        ],
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

class MyCard extends StatefulWidget {
  MyCard({
    Key? key,
    this.model,
    this.therapyTypeResponseModel,
  }) : super(key: key);
  GetAllServiceModel? model;
  TherapyTypeResponseModel? therapyTypeResponseModel;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  FToast ftoast = FToast();
  void showToast(String msg) {
    ftoast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: kBlackColor45,
        ),
        child: Text(
          msg,
          style: const TextStyle(color: kWhiteColor),
        ),
      ),
    );
  }

  @override
  void initState() {
    ftoast.init(context);

    super.initState();
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTop(context),
            _myButton(context),
            verticalSpacing10,
          ],
        ),
      ),
    );
  }

  ListTile _buildTop(BuildContext context) {
    return ListTile(
      // leading: GestureDetector(
      //   onTap: () => Get.to(const ServiceProviderProfileScreen()),
      //   child: CircleAvatar(
      //     radius: 30,
      //     child:
      //         SvgPicture.asset('assets/Images/serviceProvider-male.svg'),
      //   ),
      // ),

      title: Text(
        widget.model!.name ?? "",
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.model!.therapyName ?? ""),
          GestureDetector(
              onTap: () {
                navigatorPush(
                  context,
                  const ServiceProviderScreen(),
                );
              },
              child: Text('${widget.model!.serviceProviderName}')),
          Text(
            '${widget.model!.charges}\$',
            style: const TextStyle(
                color: kSecondaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: Text(
        DateFormat('dd-MM-yyyy')
            .format(DateTime.parse(widget.model!.validTill!)),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Container _myButton(BuildContext context) {
    return Container(
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
              serviceProviderId: widget.model!.serviceProviderId,
              price: widget.model?.charges.toString(),
              serviceId: widget.model!.id,
            ));
          },
          fontColor: kWhiteColor,
          bgColor: kBlueAccentColor,
          buttonText: 'Buy Now',
        ),
      ),
    );
  }
}
