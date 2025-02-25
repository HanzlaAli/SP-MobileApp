// ignore_for_file: must_be_immutable, file_names
import 'dart:ui';
// import 'package:date_time_picker/date_time_picker.dart';
// import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'
//     as dt_picker;
import '../../Data/Models/ChatModels/CreateChatHeadModel.dart';
import '../../Data/Models/CheckOutModel/CheckOutModel.dart';
import '../../Data/Models/TherapyType/TherapyTypeModel.dart';
import '../Bloc/CartBloc/cart_bloc.dart';
import '../Bloc/TherapyTypeBloc/therapy_type_bloc.dart';
import '../helper/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/ReusedFunctions.dart';
import 'MyButton.dart';
import 'MyTextFieldWithNoLogo.dart';

class StripePayemnt extends StatefulWidget {
  int? serviceId, serviceProviderId;
  CreateChatHeadModel createChatHeadModel;
  DateTime date, startTime, endTime;
  String? price;
  StripePayemnt(
      {required this.createChatHeadModel,
      Key? key,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.serviceProviderId,
      required this.serviceId,
      required this.price})
      : super(key: key);

  @override
  State<StripePayemnt> createState() => _StripePayemntState();
}

class _StripePayemntState extends State<StripePayemnt> {
  @override
  void initState() {
    BlocProvider.of<TherapyTypeBloc>(context).add(GetTherapyType());
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TherapyTypeResponseModel? therapyTypeResponseModel;
  final cardNumberController = TextEditingController();
  final cvcNumberController = TextEditingController();
  final expiryNumberController = TextEditingController();
  final amountNumberController = TextEditingController();
  DateTime? expiryDate;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: double.infinity,
          height: Get.height * 0.54,
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
                    _headerText(context, 'Stripe'),
                    _cardNumberTextField(),
                    verticalSpacing10,
                    _cvcTextField(),
                    verticalSpacing10,
                    _expiryDateTextField(),
                    verticalSpacing20,
                    MyButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          BlocProvider.of<CartBloc>(context).add(
                            CheckOutEvent(
                              chatHeadModel: CreateChatHeadModel(
                                uId: widget.serviceProviderId,
                              ),
                              model: CheckoutModel(
                                checkOutModel: CheckOutModel(
                                    appointmentTypeId: 2,
                                    date: widget.date.toIso8601String(),
                                    endTime: widget.endTime.toIso8601String(),
                                    startTime:
                                        widget.startTime.toIso8601String(),
                                    cardNumber: cardNumberController.text,
                                    cvc: cvcNumberController.text,
                                    expirationMonth:
                                        expiryDate?.month.toString(),
                                    expirationYear: expiryDate?.year.toString(),
                                    serviceId: widget.serviceId),
                              ),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      bgColor: kBlackColor,
                      fontColor: kPrimaryColor,
                      child: Text('Pay Now \$${widget.price}'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardNumberTextField() => MyTextFieldWithNoLogo(
      hintText: 'Card number',
      textEditingController: cardNumberController,
      validator: (val) {
        if (val == null || val == "") {
          return "Field is Empty";
        } else if (val.length < 16 || val.length > 16) {
          return "Enter a valid credit card number";
        }
      });
  Widget _expiryDateTextField() =>
      //  kIsWeb
      // ?
      //  SizedBox(
      //     width: getWidth(MediaQuery.of(context).size.width),
      //     child: DateTimePicker(
      //       firstDate: DateTime(2023),
      //       lastDate: DateTime(2100),
      //       onChanged: (val) {
      //         expiryNumberController.text =
      //             dateTimetoDateConverter(DateTime.parse(val));
      //         expiryDate = DateTime.parse(val);
      //         setState(() {});
      //       },
      //       dateLabelText: 'Expiry Date',
      //       controller: expiryNumberController,
      //       decoration: InputDecoration(
      //         hintText: 'Expiry Date',
      //         errorBorder: textFielderrorBorder,
      //         focusedErrorBorder: textFielderrorBorder,
      //         focusedBorder: textFieldFocusBorder,
      //         contentPadding:
      //             const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      //         enabledBorder: textFieldEnabledBorder,
      //         filled: true,
      //       ),
      //     ),
      //   )

      // :
      MyTextFieldWithNoLogo(
        readOnly: true,
        hintText: 'Expiry Date',
        onTap: () {
          // DatePicker.showDatePicker(context,
          //     theme: const dt_picker.DatePickerTheme(
          //       containerHeight: 210.0,
          //     ),
          //     showTitleActions: true, onConfirm: (date) {
          //   expiryNumberController.text = dateTimetoDateConverter(date);
          //   expiryDate = date;
          //   setState(() {});
          // }, currentTime: DateTime.now(), locale: LocaleType.en);
        },
        textEditingController: expiryNumberController,
        validator: (val) {},
      );
  Widget _cvcTextField() => MyTextFieldWithNoLogo(
      hintText: 'CVC',
      textEditingController: cvcNumberController,
      validator: (val) {
        if (val == null || val == "") {
          return "Field is Empty";
        } else if (val.length < 3 || val.length > 3) {
          return "Enter a valid credit cvc";
        }
      });

  Widget _headerText(BuildContext context, String text) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, size: 15)),
              Text(
                text,
                style: const TextStyle(
                    color: kBlackColor38, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Icon(Icons.arrow_drop_down_sharp, color: kBlackColor38)
        ],
      );
}
