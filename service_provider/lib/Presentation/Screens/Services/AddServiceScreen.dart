// ignore_for_file: must_be_immutable, file_names
//import 'package:date_time_picker/date_time_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../../../Presentation/helper/ReusedFunctions.dart';
import '../../../Data/Models/ServicesModels/AddServiceModel.dart';
import '../../../Data/Models/ServicesModels/UpdateServiceModel.dart'
    as updateService;
import '../../../Data/Models/TherapyModels/GetServiceProviderTherapyModel.dart';
import '../../../Presentation/Bloc/GetServiceProviderTherapiesBloc/get_serviceProvider_therapies_bloc.dart';
import '../../../Presentation/Bloc/ServicesBloc/services_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import '../../../Presentation/helper/Constants/Constants.dart';
import '../../../Presentation/Widgets/MyButton.dart';
import '../../../Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'
//     as dt_picker;
import 'package:get/get.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MySpaces.dart';
import '../../../Data/Models/ServicesModels/GetServiceModel.dart';
import '../../Widgets/MyDropdownWithNoLogo.dart';
import '../../helper/Constants/MyTextFieldsStyling.dart';

class AddServices extends StatefulWidget {
  GetServicesModel? model;
  AddServices({super.key, this.model});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  @override
  void initState() {
    BlocProvider.of<GetServiceProviderTherapiesBloc>(context)
        .add(GetAllServiceProviderTherapies());
    if (widget.model != null) {
      nameController.text = widget.model!.name.toString();
      chargesController.text = widget.model!.charges!.round().toString();
      numberOfTimesAvalibleController.text =
          widget.model!.numberOfTimesAvailable.toString();
      validTillController.text = dateTimetoDateConverter(
          DateTime.parse(widget.model!.validTill.toString()));
      validTill =
          DateTime.parse(widget.model!.validTill.toString()).toIso8601String();
    }
    super.initState();
  }

  GetServiceProviderTherapyModel? getServiceProviderTherapyModel;

  final nameController = TextEditingController();
  final chargesController = TextEditingController();
  final numberOfTimesAvalibleController = TextEditingController();
  final validTillController = TextEditingController();
  String? validTill;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height,
        child: Card(
          shape:
              const RoundedRectangleBorder(borderRadius: servicesWidgetRadius),
          elevation: 10,
          //   margin: const EdgeInsets.symmetric(horizontal: 18),
          color: kPrimaryColor,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: servicesWidgetRadius,
              color: kWhiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerText(
                      context,
                      widget.model != null
                          ? "Update Service"
                          : 'Add New Services'),
                  verticalSpacing20,
                  _nameTextField(),
                  verticalSpacing20,
                  _therapyTypeTextBox(),
                  verticalSpacing20,
                  _chargesTextField(),
                  verticalSpacing20,
                  _noOfTimesAvalibleTextField(),
                  verticalSpacing20,
                  dateTextBox(),
                  verticalSpacing20,
                  _submitButton(context),
                  verticalSpacing20,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dateTextBox() => kIsWeb
      ? SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DateTimePicker(
            firstDate: DateTime(2022),
            lastDate: DateTime(2100),
            type: DateTimePickerType.date,
            dateLabelText: 'Date',
            controller: validTillController,
            onChanged: (val) {
              validTillController.text =
                  dateTimetoDateConverter(DateTime.parse(val));
              // fromDate = TimeOfDay(
              //     hour: DateTime.parse(val).hour,
              //     minute: DateTime.parse(val).minute);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Date',
              errorBorder: textFielderrorBorder,
              focusedErrorBorder: textFielderrorBorder,
              focusedBorder: textFieldFocusBorder,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: textFieldEnabledBorder,
              filled: true,
            ),
          ),
        )
      : MyTextFieldWithNoLogo(
          hintText: 'Date',
          readOnly: true,
          onTap: () {
            // DatePicker.showDatePicker(context,
            //     theme: const dt_picker.DatePickerTheme(
            //       containerHeight: 210.0,
            //     ),
            //     showTitleActions: true, onConfirm: (date) {
            //   validTillController.text = dateTimetoDateConverter(date);
            //   validTill = date.toIso8601String();
            //   setState(() {});
            // }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          textEditingController: validTillController,
          validator: (val) {},
        );

  MyButton _submitButton(BuildContext context) {
    return MyButton(
      onPressed: () {
        if (getServiceProviderTherapyModel != null) {
          submit();
          Get.back();
        }
      },
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      buttonText: widget.model != null ? 'Update' : 'Add',
    );
  }

  void submit() {
    if (widget.model != null && widget.model!.id != null) {
      BlocProvider.of<ServicesBloc>(context).add(
        UpdateService(
          model: updateService.UpdateServiceModel(
              service: updateService.Service(
            id: widget.model!.id,
            charges: int.parse(chargesController.text),
            serviceProviderTherapyId: getServiceProviderTherapyModel!.id,
            name: nameController.text,
            numberOfTimesAvailable:
                int.parse(numberOfTimesAvalibleController.text),
            validTill: DateTime.now().toIso8601String(),
          )),
        ),
      );
    } else {
      BlocProvider.of<ServicesBloc>(context).add(
        AddNewService(
          model: AddServicesModel(
            service: Service(
              charges: int.parse(chargesController.text),
              serviceProviderTherapyId: getServiceProviderTherapyModel!.id,
              name: nameController.text,
              numberOfTimesAvailable:
                  int.parse(numberOfTimesAvalibleController.text),
              validTill: validTill,
            ),
          ),
        ),
      );
    }
  }

  MyTextFieldWithNoLogo _noOfTimesAvalibleTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: numberOfTimesAvalibleController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty";
        }
        return '';
      },
      hintText: 'No of times avalible',
    );
  }

  MyTextFieldWithNoLogo _chargesTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: chargesController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty";
        }
        return '';
      },
      hintText: 'Charges',
    );
  }

  MyTextFieldWithNoLogo _nameTextField() {
    return MyTextFieldWithNoLogo(
      textEditingController: nameController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty";
        }
        return '';
      },
      hintText: 'Name',
    );
  }

  Widget _therapyTypeTextBox() =>
      BlocBuilder<GetServiceProviderTherapiesBloc, GetServiceProviderTherapiesState>(
        builder: (context, state) {
          if (state is GetServiceProviderTherapiesLoading) {
          } else if (state is GetServiceProviderTherapiesLoaded) {
            if (widget.model != null && widget.model!.id != null) {
              getServiceProviderTherapyModel = state.list?.firstWhere((x) =>
                  x.therapyName?.toLowerCase() ==
                  widget.model?.therapyName?.toLowerCase());
            }

            return SizedBox(
              width: kIsWeb ? Get.width * 0.3 : Get.width * 0.8,
              child: MyDropDownTextFieldwithNoLogo(
                hintText: 'Therapy Type',
                value: (getServiceProviderTherapyModel ?? null),
                validator: (val) {
                  return null;
                },
                onChanged: (newValue) {
                  setState(() {
                    getServiceProviderTherapyModel = state.list!
                        .singleWhere((licenseType) => licenseType == newValue);
                  });
                },
                items: state.list!.map((val) {
                  return DropdownMenuItem<GetServiceProviderTherapyModel>(
                    value: val,
                    child: Text(val.therapyName!),
                  );
                }).toList(),
              ),
            );
          } else if (state is GetServiceProviderTherapiesError) {}
          return Container();
        },
      );

  Widget _headerText(BuildContext context, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: kBlackColor38,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ],
      );
}
