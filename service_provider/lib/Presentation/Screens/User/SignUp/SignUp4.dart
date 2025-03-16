import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mended_soluctions/Data/Models/insurance_model/create_insurance_model.dart';
import 'package:mended_soluctions/Presentation/Bloc/insurance_bloc/insurance_bloc.dart';
import 'package:mended_soluctions/Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import 'package:mended_soluctions/Presentation/helper/Constants/MySpaces.dart';
import 'package:mended_soluctions/Presentation/helper/ReusedFunctions.dart';
import '../../../../Core/Routes/Routes.dart';
import '../../../../Presentation/helper/Constants/MyColors.dart';
import '../../../Widgets/MyAppBarWidget.dart';
import '../../../Widgets/MyButton.dart';
import '../../../Widgets/MyDropdownWithNoLogo.dart';
import '../../../helper/enums/insurance_type.dart';
import '../../AppointmentSchedule/WeekDaysScreen.dart';

class SignUp4 extends StatefulWidget {
  @override
  _SignUp4State createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  final TextEditingController _insuranceTypeController =
      TextEditingController();
  final TextEditingController _coverageDetailsController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _insuranceProviderNameController =
      TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  final TextEditingController _coverageLimitController =
      TextEditingController();
  final TextEditingController _deductibleController = TextEditingController();
  InsuranceTypes? insuranceType = InsuranceTypes.generalLiabilityInsurance;
  DateTime? startDate, expiryDate;

  @override
  void dispose() {
    _insuranceTypeController.dispose();
    _coverageDetailsController.dispose();
    _startDateController.dispose();
    _expiryDateController.dispose();
    _insuranceProviderNameController.dispose();
    _policyNumberController.dispose();
    _coverageLimitController.dispose();
    _deductibleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InsuranceBloc, InsuranceState>(
      listener: (context, state) {
        if (state is InsuranceSuccess) {
          // BlocProvider.of<GetProfileBloc>(context).add(GetServiceProviderProfileEvent());
          if (kIsWeb) {
            Future.delayed(
                const Duration(seconds: 3),
                () => navigatorPushAndRemoveUntil(
                    context,
                    WeekDayScreen(
                      isNew: true,
                    )));
          } else {
            Future.delayed(
                const Duration(seconds: 3),
                () => navigatorPushAndRemoveUntil(
                    context,
                    WeekDayScreen(
                      isNew: true,
                    )));
          }
        } else if (state is InsuranceError) {
          Get.snackbar("Opps!", 'Error');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _appIcon(),
                  verticalSpacing20,
                  Column(
                    children: [
                      _buildInsuranceTypeDropDown(),
                      _buildTextField(_coverageDetailsController,
                          'Coverage Details', TextInputType.multiline),
                      _buildStartDateTextField(),
                      _buildExpiryDateTextField(),
                      _buildTextField(_insuranceProviderNameController,
                          'Insurance Provider Name', TextInputType.name),
                      _buildTextField(_policyNumberController, 'Policy Number',
                          TextInputType.number),
                      _buildTextField(_coverageLimitController,
                          'Coverage Limit', TextInputType.number),
                      _buildTextField(_deductibleController, 'Deductible',
                          TextInputType.number),
                      const SizedBox(height: 20),
                      MyButton(
                        onPressed: () {
                          BlocProvider.of<InsuranceBloc>(context).add(
                            CreateInsurance(
                              model: CreateInsuranceModel(
                                  coverageDetails:
                                      _coverageDetailsController.text,
                                  coverageLimit: int.tryParse(
                                      _coverageLimitController.text),
                                  deductible:
                                      int.tryParse(_deductibleController.text),
                                  expiryDate: expiryDate?.toIso8601String(),
                                  insuranceProviderName:
                                      _insuranceProviderNameController.text,
                                  insuranceType: insuranceType?.index,
                                  policyNumber: _policyNumberController.text,
                                  serviceProviderEmail: '',
                                  startDate: startDate?.toIso8601String()),
                            ),
                          );
                        },
                        buttonText: 'Next',
                        bgColor: kPrimaryColor,
                        fontColor: kWhiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appIcon() => MyAppBarWidget(
        pageNo: '(4 of 4)',
        text: "Your Insurance",
      );

  Widget _buildInsuranceTypeDropDown() {
    List<DropdownMenuItem<InsuranceTypes>> insuranceTypeItems =
        InsuranceTypes.values
            .map((type) => DropdownMenuItem<InsuranceTypes>(
                  value: type,
                  child: Text(getInsuranceTypeString(type.index)),
                ))
            .toList();

    return MyDropDownTextFieldwithNoLogo(
      items: insuranceTypeItems,
      value: insuranceType,
      hintText: 'Select Insurance Type',
      onChanged: (value) {
        setState(() {
          insuranceType = value as InsuranceTypes?;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select an insurance type';
        }
        return null;
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      TextInputType? keyboardType,
      {bool readOnly = false, DateTime? date}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MyTextFieldWithNoLogo(
        hintText: label,
        keyboardType: keyboardType,
        readOnly: readOnly,
        textEditingController: controller,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
        onTap: () {
          if (readOnly) {
            BottomPicker.date(
              pickerTitle: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
              onSubmit: (time) {
                controller.text = dateTimetoDateConverter(time);
                date = time;
                setState(() {});
              },
              onCloseButtonPressed: () {
                print('Picker closed');
              },
              bottomPickerTheme: BottomPickerTheme.temptingAzure,
              initialDateTime: DateTime.now(),
            ).show(context);
          }
        },
      ),
    );
  }

  Widget _buildStartDateTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MyTextFieldWithNoLogo(
        hintText: 'Start Date',
        readOnly: true,
        textEditingController: _startDateController,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
        onTap: () {
          BottomPicker.date(
            pickerTitle: const Text(
              'Start Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: kPrimaryColor,
              ),
            ),
            onSubmit: (time) {
              _startDateController.text = dateTimetoDateConverter(time);
              startDate = time;
              setState(() {});
            },
            onCloseButtonPressed: () {
              print('Picker closed');
            },
            bottomPickerTheme: BottomPickerTheme.temptingAzure,
            initialDateTime: DateTime.now(),
          ).show(context);
        },
      ),
    );
  }

  Widget _buildExpiryDateTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MyTextFieldWithNoLogo(
        readOnly: true,
        hintText: 'Expiry Date',
        textEditingController: _expiryDateController,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
        onTap: () {
          BottomPicker.date(
            pickerTitle: const Text(
              'Expiry Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: kPrimaryColor,
              ),
            ),
            onSubmit: (time) {
              _expiryDateController.text = dateTimetoDateConverter(time);
              expiryDate = time;
              setState(() {});
            },
            onCloseButtonPressed: () {
              print('Picker closed');
            },
            bottomPickerTheme: BottomPickerTheme.temptingAzure,
            initialDateTime: DateTime.now(),
          ).show(context);
        },
      ),
    );
  }
}
