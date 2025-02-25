import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../Presentation/helper/Constants.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
import '../../../Data/Models/ServicesModels/GetAllServicesModel.dart';
import '../../../Data/Models/ServicesModels/GetServiceProviderServiceRequestModel.dart';
import '../../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
import '../../Bloc/GetServiceProvidersBloc/get_serviceProviders_bloc.dart';
import '../../Bloc/GetServicesByServiceProviderBloc/get_services_by_serviceProvider_bloc.dart';
import '../../Widgets/ServiceProviderSlotsWidget.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyDrawer.dart';
import '../../helper/ReusedFunctions.dart';

import '../ErrorHandling/EmptyDataScreen.dart';
import '../ErrorHandling/InternalServerErrorScreen.dart';
import '../Profile/ServiceProvidersProfieScreen.dart';
import '../ServiceProvider/ServiceProviderScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<GetServiceProvidersBloc>(context).add(GetAllServiceProviders());
    BlocProvider.of<GetAllServicesBloc>(context).add(GetAllServices());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: MyAppBar(
        title: 'Home',
        isHome: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 370,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpacing20,
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Our Top Service Providers',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: BlocBuilder<GetServiceProvidersBloc, GetServiceProvidersStateBase>(
                        builder: (context, state) {
                      if (state is GetServiceProvidersLoading) {
                        return _shimmer(context);
                      } else if (state is GetServiceProvidersLoaded) {
                        if (state.model!.length == 0) {
                          return EmptyDataScreen(text: 'No Service Providers Avalible');
                        } else {
                          state.model!.shuffle();
                          return ListView.builder(
                              itemCount: state.model?.length == null
                                  ? 0
                                  : (state.model!.length > 6
                                      ? 6
                                      : state.model?.length),
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
                                          child: MyServiceProvidersCard(
                                              model: state.model![index]),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              });
                        }
                      }
                      return Container();
                    }))
              ],
            ),
          ),
          SizedBox(
            height: 370,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpacing20,
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Our Services',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child:
                      BlocBuilder<GetAllServicesBloc, GetAllServicesStateBase>(
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
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.filteredList != null
                                      ? (state.filteredList!.length /
                                              columnCount)
                                          .ceil()
                                      : (state.model!.length / columnCount)
                                          .ceil(),
                                  itemBuilder: (context, rowindex) {
                                    return Row(
                                      children: List.generate(
                                        columnCount,
                                        (columnindex) {
                                          final int index =
                                              rowindex * columnCount +
                                                  columnindex;
                                          var val = state.filteredList != null
                                              ? state.filteredList!.length
                                              : state.model!.length;
                                          if (index >= val) {
                                            return Expanded(child: Container());
                                          }
                                          return Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: MyCustomerCard(
                                                  model:
                                                      state.filteredList == null
                                                          ? state.model![index]
                                                          : state.filteredList![
                                                              index]),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      height: 200,
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
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                ),
              ),
            ),
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}

class MyServiceProvidersCard extends StatelessWidget {
  MyServiceProvidersCard({
    this.model,
    Key? key,
  }) : super(key: key);
  GetServiceProvidersModel? model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetServicesByServiceProviderBloc>(context).add(GetServiceProviderServices(
            model: GetServiceProviderServicesReuqestModel(
                serviceProviderEmail: model!.serviceProviderEmail)));
        navigatorPush(
            context,
            ServiceProviderProfileScreen(
              model: model!,
            ));
      },
      child: _mycard(),
    );
  }

  Card _mycard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.only(top: 15),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(model!.profilePicture!),
            onBackgroundImageError: (exception, stackTrace) => kErrorImage,
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              model!.fullName!,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4, left: 5),
                margin: const EdgeInsets.only(top: 2, bottom: 2),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: kSecondaryColor,
                    ),
                    Text(
                      model!.city!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: kBlackColor),
                    ),
                  ],
                ),
              ),
              verticalSpacing10,
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    model!.bio!,
                    style: const TextStyle(color: kBlackColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomerCard extends StatefulWidget {
  MyCustomerCard({
    Key? key,
    this.model,
    this.therapyTypeResponseModel,
  }) : super(key: key);
  GetAllServiceModel? model;
  TherapyTypeResponseModel? therapyTypeResponseModel;

  @override
  State<MyCustomerCard> createState() => _MyCustomerCardState();
}

class _MyCustomerCardState extends State<MyCustomerCard> {
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
