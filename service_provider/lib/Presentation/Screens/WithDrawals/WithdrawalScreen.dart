// import 'package:date_time_picker/date_time_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../../../../Presentation/helper/Constants/MySpaces.dart';
import '../../../../Data/Models/WithdrawModels/CreateWithdrawAccountRequestModel.dart';
import '../../../../Presentation/Bloc/WithdrawBloc/withdraw_bloc.dart';
import '../../../../Presentation/Widgets/MyAppBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart'
//     as dt_picker;
import 'package:get/get.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/ThemeBloc/theme_bloc.dart';
import '../../helper/Constants/MyColors.dart';
import '../../../Data/Models/WithdrawModels/WithdrawRequestModel.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyTextFieldWithNoLogo.dart';
import '../../helper/Constants/MyTextFieldsStyling.dart';
import '../../helper/ReusedFunctions.dart';
import '../Home/Home.dart';

class WithdrawRequestScreen extends StatefulWidget {
  const WithdrawRequestScreen({super.key});

  @override
  State<WithdrawRequestScreen> createState() => _WithdrawRequestScreenState();
}

class _WithdrawRequestScreenState extends State<WithdrawRequestScreen> {
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvcNumberController = TextEditingController();
  final amountNumberController = TextEditingController();
  DateTime? expiryDate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return Scaffold(
          appBar: MyAppBar(isDrawer: false, title: 'Withdraw'),
          body: BlocListener<WithdrawBloc, WithdrawState>(
            listener: (context, state) {
              if (state is WithdrawLoading) {
                Get.snackbar("Loading...", "Please wait");
              } else if (state is WithdrawLoaded || state is WithdrawSuccess) {
                Get.snackbar("Request Sent!", "Please wait for approval");

                navigatorPush(context, const HomeScreen());
              } else if (state is WithdrawError) {
                Get.snackbar("Opps!", "Something went wrong try again later");
              }
            },
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_card,
                      size: 120,
                      color: themeState is DarkThemeState
                          ? kWhiteColor
                          : kBlackColor38,
                    ),
                    verticalSpacing20,
                    _cardNumberTextField(),
                    verticalSpacing10,
                    _cvcTextField(),
                    verticalSpacing10,
                    _expiryDateTextField(),
                    verticalSpacing10,
                    _amountDateTextField(),
                    verticalSpacing20,
                    MyButton(
                      onPressed: () {
                        BlocProvider.of<WithdrawBloc>(context).add(
                          SendWithdrawRequest(
                            model: WithdrawRequestModel(
                              createWithdrawalRequestModel:
                                  CreateWithdrawalRequestModel(
                                amount: int.tryParse(amountNumberController.text),
                              ),
                            ),
                            createWithdrawAccountRequestModel:
                                CreateWithdrawAccountRequestModel(
                              createWithdrawalAccountModel:
                                  CreateWithdrawalAccountModel(
                                creditCardNumber: cardNumberController.text,
                                cvc: int.tryParse(cvcNumberController.text),
                                expiryDate: expiryDate?.toIso8601String(),
                              ),
                            ),
                          ),
                        );
                      },
                      //  bgColor: kBlackColor,
                      fontColor: kWhiteColor,
                      buttonText: 'Withdraw',
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _expiryDateTextField() => kIsWeb
      ? SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DateTimePicker(
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
            type: DateTimePickerType.date,
            dateLabelText: 'Date',
            controller: expiryDateController,
            onChanged: (val) {
              expiryDateController.text =
                  dateTimetoDateConverter(DateTime.parse(val));
              expiryDate = DateTime.parse(val);
              // fromDate = TimeOfDay(
              //     hour: DateTime.parse(val).hour,
              //     minute: DateTime.parse(val).minute);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Expiry Date',
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
          hintText: 'Expiry Date',
          readOnly: true,
          onTap: () {
            // DatePicker.showDatePicker(context,
            //     theme: const dt_picker.DatePickerTheme(
            //       containerHeight: 210.0,
            //     ),
            //     showTitleActions: true, onConfirm: (date) {
            //   expiryDateController.text = dateTimetoDateConverter(date);
            //   expiryDate = date;
            //   setState(() {});
            // }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          textEditingController: expiryDateController,
          validator: (val) {},
        );
  Widget _cardNumberTextField() => MyTextFieldWithNoLogo(
      hintText: 'Card number',
      textEditingController: cardNumberController,
      validator: (val) {});

  Widget _amountDateTextField() => MyTextFieldWithNoLogo(
      hintText: 'Amount',
      textEditingController: amountNumberController,
      validator: (val) {});

  Widget _cvcTextField() => MyTextFieldWithNoLogo(
      hintText: 'CVC',
      textEditingController: cvcNumberController,
      validator: (val) {});
}
