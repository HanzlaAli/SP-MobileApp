// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mended_soluctions/Presentation/Screens/Services/widget/service_list_items.dart';
import 'package:mended_soluctions/Presentation/Screens/Services/widget/service_details.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Presentation/Bloc/ServicesBloc/services_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/EmptyDataScreen.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import 'add_service_screen.dart';

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
                                      child: ServiceListItem(
                                        model: state.list![index],
                                        onTap: () {
                                          Get.dialog(ServiceDetail(
                                            model: state.list![index],
                                          ));
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
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

  Widget _addNewServices(ThemeState themestate) => FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: kWhiteColor,
        ),
        onPressed: () => Get.bottomSheet(AddServices(
          model: null,
        )),
      );
}
