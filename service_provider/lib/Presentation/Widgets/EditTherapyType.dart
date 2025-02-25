// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, file_names
import '../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../Data/Models/TherapyModels/AddTherapy.dart';
import '../../Presentation/Bloc/AddServiceProviderTherapyBloc/add_serviceProvider_therapy_bloc.dart';
import '../../Presentation/Bloc/GetServiceProviderTherapyTypesBloc/get_therapy_types_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/Constants/MyColors.dart';

class EditTherapyTypes extends StatefulWidget {
  EditTherapyTypes({Key? key, required this.model}) : super(key: key);
  List<ServiceProviderTherapies> model;
  @override
  State<EditTherapyTypes> createState() => _EditTherapyTypesState();
}

class _EditTherapyTypesState extends State<EditTherapyTypes> {
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
          color: kPrimaryColor,
          child: BlocBuilder<GetTherapyTypesBloc, GetTherapyTypesBase>(
            builder: (context, state) {
              if (state is GetTherapyTypesLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: kPrimaryColor),
                );
              } else if (state is GetTherapyTypesLoaded) {
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
                        _headerText(context, 'Select Service Type'),
                        SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: state.getTherapyTypeModel.length,
                              itemBuilder: (context, index) {
                                var isTrue = widget.model.any((element) =>
                                    element.therapyName ==
                                    state.getTherapyTypeModel[index].name);
                                return Specialities(
                                  id: state.getTherapyTypeModel[index].id,
                                  text: state.getTherapyTypeModel[index].name ??
                                      "",
                                  isTrue: isTrue,
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is GetTherapyTypesError) {
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
  Specialities(
      {Key? key, required this.id, required this.text, required this.isTrue})
      : super(key: key);
  String text;
  var id;
  bool isTrue;
  @override
  State<Specialities> createState() => _SpecialitiesState();
}

class _SpecialitiesState extends State<Specialities> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.isTrue = !widget.isTrue;
        });
        BlocProvider.of<AddServiceProviderTherapyBloc>(context).add(
            AddServiceProviderTherapyEvent(
                addServiceProviderTherapyModel:
                    AddServiceProviderTherapyModel(therapyTypeId: widget.id)));
      },
      leading: Text(
        widget.text,
        style: const TextStyle(
            color: kBlackColor, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      trailing: Checkbox(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: widget.isTrue,
        onChanged: (check) {
          setState(() {
            widget.isTrue = check!;
          });
          BlocProvider.of<AddServiceProviderTherapyBloc>(context).add(
              AddServiceProviderTherapyEvent(
                  addServiceProviderTherapyModel:
                      AddServiceProviderTherapyModel(therapyTypeId: widget.id)));
        },
        fillColor: materialGreenColor,
        checkColor: kWhiteColor,
      ),
    );
  }
}
