// ignore_for_file: must_be_immutable, file_names
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Data/Models/ServicesModels/FilteredServiceRequestModel.dart';
import '../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../../Presentation/Bloc/GetAllServicesBloc/get_all_services_bloc.dart';
import '../../Presentation/Bloc/TherapyTypeBloc/therapy_type_bloc.dart';
import '../../Presentation/Widgets/MyButton.dart';
import '../../Presentation/Widgets/MyTextButton.dart';
import '../helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'MyDropdownWithNoLogo.dart';

class FilterServices extends StatefulWidget {
  FilterServices({Key? key, required this.onDataReceived}) : super(key: key);
  final void Function(TherapyTypeResponseModel therapy) onDataReceived;
  @override
  State<FilterServices> createState() => _FilterServicesState();
}

class _FilterServicesState extends State<FilterServices> {
  @override
  void initState() {
    ftoast.init(context);

    BlocProvider.of<TherapyTypeBloc>(context).add(GetTherapyType());
    super.initState();
  }

  FToast ftoast = FToast();
  void showToast(String msg) {
    ftoast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: kWhiteColor,
        ),
        child: Text(
          msg,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  TherapyTypeResponseModel? therapyTypeResponseModel;
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();
  DateTime? filterdate;
  TimeOfDay? fromDate, toDate;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: SizedBox(
        width: double.infinity,
        height: Get.height * 0.3,
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
          child: Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _headerText(context, 'Filter'),
                  _therapyTypeTextBox(),
                  //     verticalSpacing20,
                  //     _fromTextField(),
                  //    verticalSpacing20,
                  //     _toTextField(),
                  //      verticalSpacing20,
                  //          _dateTextField(),
                  verticalSpacing20,
                  buttons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) =>
      //  Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      // MyTextButton(
      //     color: kBlueAccentColor,
      //     text: 'Reset',
      //     onPressed: () {
      //       BlocProvider.of<GetAllServicesBloc>(context)
      //           .add(GetAllServices());
      //       Navigator.of(context).pop();
      //     }),
      Row(
        children: [
          Expanded(
            child: MyButton(
              onPressed: () => submit(),
              fontColor: kPrimaryColor,
              child: const Text('Done'),
            ),
          ),
          Expanded(
            child: MyTextButton(
              text: "Reset",
              color: Colors.red,
              onPressed: () {
                BlocProvider.of<GetAllServicesBloc>(context)
                    .add(GetAllServices());
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
  void submit() {
    widget.onDataReceived(therapyTypeResponseModel!);

    BlocProvider.of<GetAllServicesBloc>(context).add(
      GetFilteredServices(
        model: FilterServiceRequestModel(
          therapyTypeId: therapyTypeResponseModel!.id,
        ),
      ),
    );
    Navigator.of(context).pop();
  }

  // Widget _fromTextField() => kIsWeb
  //     ? SizedBox(
  //         width: getWidth(MediaQuery.of(context).size.width),
  //         child: DateTimePicker(
  //           firstDate: DateTime(2023),
  //           lastDate: DateTime(2100),
  //           type: DateTimePickerType.time,
  //           dateLabelText: 'Date',
  //           controller: fromController,
  //           onChanged: (val) {
  //             fromController.text =
  //                 dateTimetoTimeConverter(DateTime.parse(val));
  //             // fromDate = TimeOfDay(
  //             //     hour: DateTime.parse(val).hour,
  //             //     minute: DateTime.parse(val).minute);
  //             setState(() {});
  //           },
  //           decoration: InputDecoration(
  //             hintText: 'From',
  //             errorBorder: textFielderrorBorder,
  //             focusedErrorBorder: textFielderrorBorder,
  //             focusedBorder: textFieldFocusBorder,
  //             contentPadding:
  //                 const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  //             enabledBorder: textFieldEnabledBorder,
  //             filled: true,
  //           ),
  //         ),
  //       )
  //     : MyTextFieldWithNoLogo(
  //         hintText: 'From',
  //         readOnly: true,
  //         onTap: () {
  //           DatePicker.showTime12hPicker(context,
  //               theme: const DatePickerTheme(
  //                 containerHeight: 210.0,
  //               ),
  //               showTitleActions: true, onConfirm: (date) {
  //             fromController.text = dateTimetoTimeConverter(date);
  //             fromDate = TimeOfDay(hour: date.hour, minute: date.minute);
  //             setState(() {});
  //           }, currentTime: DateTime.now(), locale: LocaleType.en);
  //         },
  //         textEditingController: fromController,
  //         validator: (val) {},
  //       );

  // Widget _toTextField() => kIsWeb
  //     ? SizedBox(
  //         width: getWidth(MediaQuery.of(context).size.width),
  //         child: DateTimePicker(
  //           firstDate: DateTime(2023),
  //           lastDate: DateTime(2100),
  //           type: DateTimePickerType.time,
  //           dateLabelText: 'To',
  //           controller: toController,
  //           onFieldSubmitted: (val) {},
  //           onSaved: (val) {},
  //           onChanged: (val) {
  //             toController.text = dateTimetoTimeConverter(DateTime.parse(val));
  //             // toDate = TimeOfDay(
  //             //     hour: DateTime.parse(val).hour,
  //             //     minute: DateTime.parse(val).minute);
  //             setState(() {});
  //           },
  //           decoration: InputDecoration(
  //             hintText: 'To',
  //             errorBorder: textFielderrorBorder,
  //             focusedErrorBorder: textFielderrorBorder,
  //             focusedBorder: textFieldFocusBorder,
  //             contentPadding:
  //                 const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  //             enabledBorder: textFieldEnabledBorder,
  //             filled: true,
  //           ),
  //         ),
  //       )
  //     : MyTextFieldWithNoLogo(
  //         hintText: 'To',
  //         readOnly: true,
  //         onTap: () {
  //           DatePicker.showTime12hPicker(context,
  //               theme: const DatePickerTheme(
  //                 containerHeight: 210.0,
  //               ),
  //               showTitleActions: true, onConfirm: (date) {
  //             toController.text = dateTimetoTimeConverter(date);
  //             toDate = TimeOfDay(hour: date.hour, minute: date.minute);
  //             setState(() {});
  //           }, currentTime: DateTime.now(), locale: LocaleType.en);
  //         },
  //         textEditingController: toController,
  //         validator: (val) {},
  //       );
  // Widget _dateTextField() => kIsWeb
  //     ? SizedBox(
  //         width: getWidth(MediaQuery.of(context).size.width),
  //         child: DateTimePicker(
  //           firstDate: DateTime(2023),
  //           lastDate: DateTime(2100),
  //           type: DateTimePickerType.date,
  //           dateLabelText: 'Date',
  //           controller: dateController,
  //           onChanged: (val) {
  //             dateController.text =
  //                 dateTimetoDateConverter(DateTime.parse(val));
  //             filterdate = DateTime.parse(val);
  //             setState(() {});
  //           },
  //           decoration: InputDecoration(
  //             focusColor: kPrimaryColor,
  //             hintText: 'Date',
  //             errorBorder: textFielderrorBorder,
  //             focusedErrorBorder: textFielderrorBorder,
  //             focusedBorder: textFieldFocusBorder,
  //             contentPadding:
  //                 const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
  //             enabledBorder: textFieldEnabledBorder,
  //             filled: true,
  //           ),
  //         ),
  //       )
  //     : MyTextFieldWithNoLogo(
  //         hintText: 'Date',
  //         readOnly: true,
  //         onTap: () {
  //           DatePicker.showDatePicker(context,
  //               theme: const DatePickerTheme(
  //                 containerHeight: 210.0,
  //               ),
  //               showTitleActions: true, onConfirm: (date) {
  //             dateController.text = dateTimetoDateConverter(date);
  //             filterdate = date;
  //             setState(() {});
  //           }, currentTime: DateTime.now(), locale: LocaleType.en);
  //         },
  //         textEditingController: dateController,
  //         validator: (val) {},
  //       );

  Widget _therapyTypeTextBox() =>
      BlocBuilder<TherapyTypeBloc, TherapyTypeStateBase>(
        builder: (context, state) {
          if (state is TherapyTypeLoadingState) {
          } else if (state is TherapyTypeLoadedState) {
            return MyDropDownTextFieldwithNoLogo(
              hintText: 'Therapy Type',
              value: therapyTypeResponseModel,
              validator: (val) {
                return null;
              },
              onChanged: (newValue) {
                setState(() {
                  therapyTypeResponseModel = state.model!
                      .singleWhere((licenseType) => licenseType == newValue);
                });
              },
              items: state.model?.map((val) {
                return DropdownMenuItem<TherapyTypeResponseModel>(
                  value: val,
                  child: Text(val.name!),
                );
              }).toList(),
            );
          } else if (state is TherapyTypeErrorState) {}
          return Container();
        },
      );

  Widget _headerText(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,
                style: const TextStyle(
                    color: kBlackColor38,
                    fontWeight: FontWeight.bold,
                    fontSize: 15)),
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: kBlackColor38)),
          ],
        ),
      );
}
