// ignore_for_file: file_names

import 'dart:io';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Data/Models/ProfileModels/SetUpProfileModel.dart';
import '../../../../Data/Models/QualificationModels/CreateQualificationModel.dart';
import '../../../../Presentation/Bloc/QualificationBloc/qualification_bloc.dart';
import '../../../../Presentation/Bloc/SetUpProfileBloc/set_up_profile_bloc.dart';
import '../../../../Presentation/Screens/User/SignUp/SignUp3.dart';
import '../../../../Presentation/Widgets/MyDropdown.dart';
import '../../../../Core/Routes/Routes.dart';
import '../../../helper/Constants/Constants.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../../helper/Constants/MyIcons.dart';
import '../../../helper/Constants/MySpaces.dart';
import '../../../helper/Constants/MyTextFieldsStyling.dart';
import '../../../helper/ReusedFunctions.dart';
import '../../../Bloc/GetServiceProviderLicenseTypeBloc/get_serviceProvider_license_types_bloc.dart';
import '../../../Bloc/GetServiceProviderTherapyTypesBloc/get_therapy_types_bloc.dart';
import '../../../Widgets/MyAppBarWidget.dart';
import '../../../Widgets/MyButton.dart';
import '../../../Widgets/MyTextField.dart';
import '../../../Widgets/MyTextFieldWithNoLogo.dart';

class SignUp2 extends StatefulWidget {
  static const routeName = 'sign-up2';
  const SignUp2({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {
  String dropdownvalue = 'Select Gender';

  final buisnessAddressController = TextEditingController();

  final institutionNameController = TextEditingController();

  final nameController = TextEditingController();

  final procurementYearController = TextEditingController();

  final buisnessPhoneNocontroller = TextEditingController();

  final dateofBirthcontroller = TextEditingController();

  final streetAddressController = TextEditingController();

  final cityController = TextEditingController();

  final stateController = TextEditingController();

  final zipCodeController = TextEditingController();

  final infoController = TextEditingController();

  final buisnessAddressFocus = FocusNode();
  final institutionFocus = FocusNode();

  final buisnessPhoneNoFocus = FocusNode();

  final dateofBirthFocus = FocusNode();

  final streetAddressFocus = FocusNode();

  final cityFocus = FocusNode();

  final stateFocus = FocusNode();

  final zipCodeFocus = FocusNode();

  DateTime? dateOfBirth = DateTime.now(), pronouncmentYear = DateTime.now();

  XFile? image;

  void pickImage(bool pikedThroughGallery) async {
    ImagePicker imagePicker = ImagePicker();
    if (pikedThroughGallery) {
      XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        setState(() {
          image = img;
        });
      }
    } else {
      XFile? img = await imagePicker.pickImage(source: ImageSource.camera);

      if (img != null) {
        setState(() {
          image = img;
        });
      }
    }
    Get.back();
  }

  void showPickImageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: ((context) => Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () => pickImage(false),
              ),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_rounded),
                title: const Text('Gallery'),
                onTap: () => pickImage(true),
              ),
            ],
          )),
    );
  }

  // List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
    'Other',
  ];

  bool? yesColorValue = false;

  bool? noColorValue = false;

  bool? yesIdentifyValue = false;

  bool? noIdentifyValue = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SetUpProfileBloc, SetUpProfileStateBase>(
      listener: (context, state) {
        if (state is SetUpProfileLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is SetUpProfileSuccess) {
          Get.snackbar("Added!", 'Profile Updated');
          BlocProvider.of<GetServiceProviderLicenseTypesBloc>(context)
              .add(const GetServiceProviderLicenseTypesEvent());

          BlocProvider.of<GetTherapyTypesBloc>(context)
              .add(const GetTherapyTypesEvent());
          navigatorPushAndRemoveUntil(context, const SignUp3());
        } else if (state is SetUpProfileError) {
          Get.snackbar("Opps!", 'Error');
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: kMaximumWidgth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _appIcon(),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _headerText(context),
                          verticalSpacing20,
                          _profilePicture(),
                          verticalSpacing20,
                          _infoTextField(),
                          verticalSpacing10,
                          _genderTextBox(),
                          verticalSpacing10,
                          _buisnessAddressTextField(),
                          verticalSpacing10,
                          _buisnessPhoneNoTextField(),
                          verticalSpacing10,
                          _divider(),
                          verticalSpacing10,
                          _qualificationText(context),
                          verticalSpacing10,
                          _insitutionTextField(),
                          verticalSpacing10,
                          _nameTextField(),
                          verticalSpacing10,
                          _procurementYearTextField(),
                          verticalSpacing10,
                          _divider(),
                          verticalSpacing10,
                          _backGroundcheckText(context),
                          verticalSpacing10,
                          _dateOfBirthTextField(),
                          verticalSpacing10,
                          _streetAddressTextField(),
                          verticalSpacing10,
                          _cityTextField(),
                          verticalSpacing10,
                          _stateTextField(),
                          verticalSpacing10,
                          _zipCodeTextField(),
                        ],
                      ),
                    ),
                    verticalSpacing20,
                    _signUpButton(context),
                    verticalSpacing20,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appIcon() => MyAppBarWidget(
        pageNo: '(2 of 4)',
        text: "Profile & Backgroung Check",
      );

  Widget _headerText(BuildContext context) => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor),
              ),
              verticalSpacing10,
              Text(
                'Clients will use this information to shortlist their preferred therapists',
                style: TextStyle(
                    color: kBlackColor38,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ]),
      );

  Widget _profilePicture() => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black12,
              child: image == null
                  ? byDefaultImage
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          onError: (exception, stackTrace) => byDefaultImage,
                          fit: BoxFit.fill,
                          image: FileImage(
                            File(image!.path),
                          ),
                        ),
                      ),
                    ),
            ),
            horizontalSpacing20,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upload a Professional \n Profile Photo',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: kBlackColor38,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                verticalSpacing10,
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: materialPrimaryColor),
                  onPressed: () => showPickImageBottomSheet(),
                  child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      child: const Text(
                        'Upload',
                        style: TextStyle(color: kWhiteColor),
                      )),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _genderTextBox() => MyDropDownTextField(
        icon: dropdownvalue == "Female" ? Icons.female : Icons.male,
        hintText: 'Select Gender',
        value: dropdownvalue,
        validator: (val) {
          if (val == "Select Gender") {
            return "Please select gender";
          }
          return null;
        },
        onChanged: (newValue) {
          setState(() {
            dropdownvalue = newValue.toString();
          });
        },
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
      );

  Widget _buisnessAddressTextField() => MyTextField(
        hintText: "Buisness Address",
        textEditingController: buisnessAddressController,
        icon: Icons.location_on_outlined,
        focusNode: buisnessAddressFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(institutionFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );
  Widget _insitutionTextField() => MyTextField(
        hintText: "Institution",
        textEditingController: institutionNameController,
        icon: Icons.school,
        focusNode: institutionFocus,
        // onFieldSubmitted: (val) =>
        //     FocusScope.of(context).requestFocus(buisnessPhoneNoFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );
  Widget _nameTextField() => MyTextField(
        hintText: "Name",
        textEditingController: nameController,
        icon: Icons.school_rounded,
        //  focusNode: buisnessAddressFocus,
        // onFieldSubmitted: (val) =>
        //     FocusScope.of(context).requestFocus(buisnessPhoneNoFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.name,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );
  Widget _infoTextField() => MyTextField(
        hintText: "Bio",
        textEditingController: infoController,
        icon: Icons.info,
        // onFieldSubmitted: (val) =>
        //     FocusScope.of(context).requestFocus(),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );
  Widget _buisnessPhoneNoTextField() => MyTextField(
        hintText: "Buisness Phone No",
        textEditingController: buisnessPhoneNocontroller,
        icon: Icons.phone,
        focusNode: buisnessPhoneNoFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(dateofBirthFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _divider() => SizedBox(
      width: getWidth(MediaQuery.of(context).size.width),
      child: const Divider(color: kBlackColor38));

  Widget _backGroundcheckText(BuildContext context) => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Background Check',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor),
              ),
              verticalSpacing10,
            ]),
      );
  Widget _qualificationText(BuildContext context) => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Qualification',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor),
              ),
              verticalSpacing10,
            ]),
      );

  Widget _dateOfBirthTextField() => kIsWeb
      ? SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DateTimePicker(
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
            type: DateTimePickerType.date,
            dateLabelText: 'Date',
            controller: dateofBirthcontroller,
            onChanged: (val) {
              dateofBirthcontroller.text =
                  dateTimetoDateConverter(DateTime.parse(val));
              dateOfBirth = DateTime.parse(val);
              // fromDate = TimeOfDay(
              //     hour: DateTime.parse(val).hour,
              //     minute: DateTime.parse(val).minute);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Date of Birth',
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
          hintText: 'Date of Birth',
          readOnly: true,
          onTap: () {
            BottomPicker.date(
              pickerTitle: const Text(
                'Set your Date Of Birth',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
              onSubmit: (time) {
                dateofBirthcontroller.text = dateTimetoDateConverter(time);
                setState(() {});
              },
              onCloseButtonPressed: () {
                print('Picker closed');
              },
              bottomPickerTheme: BottomPickerTheme.temptingAzure,
              initialDateTime: DateTime.now(),
            ).show(context);
          },
          textEditingController: dateofBirthcontroller,
          validator: (val) {},
        );

  Widget _procurementYearTextField() => kIsWeb
      ? SizedBox(
          width: getWidth(MediaQuery.of(context).size.width),
          child: DateTimePicker(
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
            type: DateTimePickerType.date,
            dateLabelText: 'Date',
            controller: procurementYearController,
            onChanged: (val) {
              procurementYearController.text =
                  dateTimetoDateConverter(DateTime.parse(val));
              pronouncmentYear = DateTime.parse(val);

              // fromDate = TimeOfDay(
              //     hour: DateTime.parse(val).hour,
              //     minute: DateTime.parse(val).minute);
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: 'Procurement Year',
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
          hintText: 'Procurement Year',
          readOnly: true,
          onTap: () {
            BottomPicker.monthYear(
              pickerTitle: const Text(
                'Set your availability',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
              onSubmit: (time) {
                procurementYearController.text = dateTimetoDateConverter(time);
                setState(() {});
              },
              onCloseButtonPressed: () {
                print('Picker closed');
              },
              bottomPickerTheme: BottomPickerTheme.temptingAzure,
             initialDateTime: DateTime.now(),
            ).show(context);
          },
          textEditingController: procurementYearController,
          validator: (val) {},
        );

  Widget _streetAddressTextField() => MyTextField(
        hintText: "Street address",
        textEditingController: streetAddressController,
        icon: Icons.streetview,
        focusNode: streetAddressFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(cityFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _cityTextField() => MyTextField(
        hintText: "City",
        textEditingController: cityController,
        icon: Icons.location_city,
        focusNode: cityFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(stateFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _stateTextField() => MyTextField(
        hintText: "State",
        textEditingController: stateController,
        icon: Icons.location_on_outlined,
        focusNode: stateFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(zipCodeFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _zipCodeTextField() => MyTextField(
        hintText: "Zip Code",
        textEditingController: zipCodeController,
        icon: Icons.mail,
        focusNode: zipCodeFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(zipCodeFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _signUpButton(BuildContext context) => MyButton(
      textSize: 20,
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      onPressed: () => _submit(),
      buttonText: 'Next');

  void _submit() {
    dateOfBirth = DateTime.now();
    pronouncmentYear = DateTime.now();
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      BlocProvider.of<SetUpProfileBloc>(context).add(SetUpProfile(
          model: SetUpProfileModel(
              bio: infoController.text,
              businessAddress: buisnessAddressController.text,
              businessPhoneNumber: buisnessPhoneNocontroller.text,
              city: cityController.text,
              dateOfBirth: dateOfBirth?.toIso8601String(),
              gender: dropdownvalue,
              profilePicture: image!.path,
              profilePictureFile: image,
              state: stateController.text,
              streetAddress: streetAddressController.text,
              userEmail: "",
              zip: zipCodeController.text)));
      BlocProvider.of<QualificationBloc>(context).add(AddQualification(
          model: CreateQualificationModel(
              institutionName: institutionNameController.text,
              name: nameController.text,
              procurementYear: pronouncmentYear?.toIso8601String())));
    }
  }
}
