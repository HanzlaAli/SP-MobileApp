// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables
import '../../Data/Models/SpecializationModel/AddServiceProviderSpecializationModel.dart';
import '../../Presentation/Bloc/AddServiceProviderSpecializationBloc/add_serviceProvider_specialization_bloc.dart';
import '../../Presentation/Bloc/GetServiceProviderSpecializationBloc/get_serviceProvider_specialization_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyColors.dart';

class ServiceProviderSpecialities extends StatefulWidget {
  const ServiceProviderSpecialities({super.key});

  @override
  State<ServiceProviderSpecialities> createState() => _ServiceProviderSpecialitiesState();
}

class _ServiceProviderSpecialitiesState extends State<ServiceProviderSpecialities> {
  bool checkBoxOnchanged = false;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.6,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kWhiteColor,
          child: BlocBuilder<GetServiceProviderSpecializationBloc,
              GetServiceProviderSpecializationStateBase>(
            builder: (context, state) {
              if (state is GetServiceProviderSpecializationLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              } else if (state is GetServiceProviderSpecializationLoaded) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: kWhiteColor,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _headerText(context, 'Select your Specialities'),
                        SizedBox(
                            height: 500,
                            child: ListView.builder(
                              itemCount: state.getSpecializationModel.length,
                              itemBuilder: (context, index) => Specialities(
                                text:
                                    state.getSpecializationModel[index].name ??
                                        "",
                                id: state.getSpecializationModel[index].id,
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              } else if (state is GetServiceProviderSpecializationError) {
                return const Center(
                  child: Text('Something wen\'t wrong'),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _headerText(BuildContext context, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.arrow_drop_down_sharp, color: kBlackColor38)
        ],
      );
}

class Specialities extends StatefulWidget {
  Specialities({Key? key, required this.id, required this.text})
      : super(key: key);
  String text;
  var id;
  @override
  State<Specialities> createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities> {
  bool checkBoxOnchanged = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          checkBoxOnchanged = !checkBoxOnchanged;
        });
        BlocProvider.of<AddServiceProviderSpecializationBloc>(context).add(
          AddServiceProviderSpecializationEvent(
            serviceProviderSpecializationModel: AddServiceProviderSpecializationModel(
                serviceProviderEmail: "", specializationId: widget.id),
          ),
        );
      },
      leading: Text(
        widget.text,
        style: const TextStyle(
            color: kBlackColor, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      trailing: Checkbox(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: checkBoxOnchanged,
        onChanged: (check) {
          setState(() {
            checkBoxOnchanged = check!;
          });
        },
        fillColor: materialGreenColor,
        checkColor: kWhiteColor,
      ),
    );
  }
}
