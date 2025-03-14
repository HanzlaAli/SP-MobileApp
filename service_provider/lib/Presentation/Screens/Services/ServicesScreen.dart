// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Data/Models/ServicesModels/DeleteServicesModel.dart';
import '../../../Presentation/Bloc/ServicesBloc/services_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Presentation/Widgets/ServiceDetails.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import '../../../Data/Models/ServicesModels/GetServiceModel.dart';
import 'AddServiceScreen.dart';

class ServiceScreen extends StatefulWidget {
  static const routeName = '/service';
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    BlocProvider.of<ServicesBloc>(context).add(GetAllService());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int columnCount = getCount(MediaQuery.of(context).size.width);

    return BlocListener<ServicesBloc, ServicesStateBase>(
      listener: (context, state) {
        if (state is ServicesBlocLoading) {
          if (state.isSuccess == true) {
            Get.snackbar("Loading...", "Please wait");
          }
        } else if (state is ServicesLoaded) {
          if (state.successModel != null) {
            Get.snackbar("Success", state.successModel!.message!);
          }
        } else if (state is ServicesError) {
          if (state.isSuccess != true) {
            Get.snackbar("Opps", "Try Again");
          }
        }
      },
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themestate) {
          return Scaffold(
            backgroundColor: kWhiteColor,
            body: RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<ServicesBloc>(context).add(GetAllService());
              },
              child: BlocBuilder<ServicesBloc, ServicesStateBase>(
                builder: (context, state) {
                  if (state is ServicesBlocLoading) {
                    return _shimmer(context);
                  } else if (state is ServicesLoaded) {
                    if (state.list!.isEmpty) {
                      return Center(
                        child: EmptyDataScreen(text: 'No Services!'),
                      );
                    } else {
                      if (state.list?.length == 0) {
                        return Center(
                          child: EmptyDataScreen(text: 'Empty!'),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: state.list!.length,
                            itemBuilder: (context, rowindex) {
                              return Row(
                                children: List.generate(
                                  columnCount,
                                  (columnindex) {
                                    final int index =
                                        rowindex * columnCount + columnindex;
                                    if (index >= state.list!.length) {
                                      return Expanded(child: Container());
                                    } else {
                                      return Expanded(
                                        child: Card(
                                            color: themestate is DarkThemeState
                                                ? kPrimaryColor
                                                : kWhiteColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            elevation: 10,
                                            child: _myListTileWidget(
                                                state.list![index],
                                                context,
                                                themestate)),
                                      );
                                    }
                                  },
                                ),
                              );
                            });
                      }
                    }
                  } else if (state is ServicesError) {
                    return const Center(
                      child: InternalServerErrorScreen(),
                    );
                  }
                  return Container();
                },
              ),
            ),
            floatingActionButton: _addNewServices(themestate),
          );
        },
      ),
    );
  }

  Widget _myListTileWidget(GetServicesModel? model, BuildContext context,
          ThemeState themestate) =>
      Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        confirmDismiss: (direction) async =>
            await _onDeletePopUp(context, model!.id!, themestate),
        key: Key(model!.id.toString()),
        child: ListTile(
          textColor: themestate is DarkThemeState ? kWhiteColor : kBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onLongPress: () => _onEditPopUp(context, model, themestate),
          onTap: () => Get.dialog(ServiceDetail(
            model: model,
          )),
          title: Text(model.name!),
          subtitle: Text('${model.charges}\$'),
        ),
      );
  SizedBox _shimmer(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[350]!,
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
                    height: 60,
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

  Future _onDeletePopUp(BuildContext context, int id, ThemeState themestate) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:
                themestate is DarkThemeState ? kBlackColor : kWhiteColor,
            title: Text(
              "Confirm",
              style: TextStyle(
                color: themestate is DarkThemeState ? kWhiteColor : kBlackColor,
              ),
            ),
            content: Text(
              "Are you sure you want to delete this item?",
              style: TextStyle(
                color: themestate is DarkThemeState ? kWhiteColor : kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  BlocProvider.of<ServicesBloc>(context).add(
                      DeleteService(model: DeleteServiceModel(serviceId: id)));
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
            ],
          );
        },
      );

  void _onEditPopUp(BuildContext context, GetServicesModel model,
          ThemeState themestate) =>
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:
                themestate is DarkThemeState ? kBlackColor : kWhiteColor,
            title: Text(
              "Confirm",
              style: TextStyle(
                color: themestate is DarkThemeState ? kWhiteColor : kBlackColor,
              ),
            ),
            content: Text(
              "Are you sure you want edit this Item",
              style: TextStyle(
                color: themestate is DarkThemeState ? kWhiteColor : kBlackColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () {
                  Navigator.pop(context);
                  Get.bottomSheet(AddServices(
                    model: model,
                  ));
                },
                child: const Text('Yes'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimaryColor)),
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              ),
            ],
          );
        },
      );

  Widget _addNewServices(ThemeState themestate) => FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => Get.bottomSheet(AddServices(
          model: null,
        )),
      );
}
