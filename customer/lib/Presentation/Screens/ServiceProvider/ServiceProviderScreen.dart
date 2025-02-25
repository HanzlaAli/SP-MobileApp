// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/helper/Constants.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Data/Models/ServicesModels/GetServiceProviderServiceRequestModel.dart';

import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Data/Models/ServiceProviderModels/GetServiceProvidersModel.dart';
import '../../Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
import '../../Bloc/GetServiceProvidersBloc/get_serviceProviders_bloc.dart';
import '../../Bloc/GetServicesByServiceProviderBloc/get_services_by_serviceProvider_bloc.dart';
import '../../Widgets/MyDrawer.dart';
import '../Profile/ServiceProvidersProfieScreen.dart';


class ServiceProviderScreen extends StatefulWidget {
  static const routeName = '/serviceProvider-service';
  const ServiceProviderScreen({super.key});

  @override
  State<ServiceProviderScreen> createState() => _ServiceProviderScreenState();
}

class _ServiceProviderScreenState extends State<ServiceProviderScreen> {
  @override
  void initState() {
    BlocProvider.of<GetAllServicesBloc>(context).add(GetAllServices());
    BlocProvider.of<GetServiceProvidersBloc>(context).add(GetAllServiceProviders());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: MyAppBar(title: 'Service Providers'),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GetServiceProvidersBloc>(context).add(GetAllServiceProviders());
          BlocProvider.of<GetAllServicesBloc>(context).add(GetAllServices());
        },
        child: BlocBuilder<GetServiceProvidersBloc, GetServiceProvidersStateBase>(
          builder: (context, state) {
            if (state is GetServiceProvidersLoading) {
              return _shimmer(context);
            } else if (state is GetServiceProvidersLoaded) {
              if (state.model!.length == 0) {
                return EmptyDataScreen(text: 'No Service Providers Avalible');
              } else {
                return ListView.builder(
                    itemCount: state.model?.length,
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
                                child: MyCard(model: state.model![index]),
                              ),
                            );
                          },
                        ),
                      );
                    });
              }
            } else if (state is GetServiceProvidersError) {
              return const InternalServerErrorScreen();
            }
            return Container();
          },
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
                    height: 120,
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

class MyCard extends StatelessWidget {
  MyCard({
    this.model,
    Key? key,
  }) : super(key: key);
  GetServiceProvidersModel? model;
  bool onImgError = false;
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
            onBackgroundImageError: (exception, stackTrace) {
              byDefaultImage;
            },
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
