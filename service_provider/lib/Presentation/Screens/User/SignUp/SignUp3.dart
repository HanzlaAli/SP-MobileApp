// ignore_for_file: file_names
// ignore_for_file: must_be_immutable, sort_child_properties_last
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Data/Models/LicenseModels/AddServiceProviderLicense.dart';
import '../../../../Presentation/Bloc/AddServiceProviderLicenseBloc/add_serviceProvider_license_bloc.dart';
import '../../../../Presentation/Bloc/GetServiceProviderLicenseTypeBloc/get_serviceProvider_license_types_bloc.dart';
import '../../../../Presentation/Screens/AppointmentSchedule/WeekDaysScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Presentation/Widgets/ServiceProviderSpecialities.dart';
import '../../../../Presentation/Widgets/MyDropdownWithNoLogo.dart';
import '../../../../Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import '../../../../Presentation/Widgets/TherapyTypes.dart';
import '../../../../Core/Routes/Routes.dart';
import '../../../helper/Constants/Constants.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../../helper/Constants/MyIcons.dart';
import '../../../helper/Constants/MySpaces.dart';
import '../../../helper/ReusedFunctions.dart';
import '../../../../Data/Models/LicenseModels/GetLicenseTypeModel.dart';
import '../../../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../Widgets/MyAppBarWidget.dart';
import '../../../Widgets/MyButton.dart';
import '../LogIn/LogIn.dart';

class SignUp3 extends StatefulWidget {
  static const routeName = 'signup-3';
  const SignUp3({Key? key}) : super(key: key);

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  final _formKey = GlobalKey<FormState>();
  GetLicenseTypeModel? getLicenseTypeModel;

  String dropdownvalue = 'Select Gender';

  final licenseingBoardController = TextEditingController();

  final licenseNumberController = TextEditingController();

  final licenseIssueDateController = TextEditingController();

  final licenseExpiryDateController = TextEditingController();

  final licenseingBoardNode = FocusNode();

  final licenseNumberNode = FocusNode();

  final licenseIssueNode = FocusNode();

  final licenseExpiryDateNode = FocusNode();

  XFile? frontImage;
  XFile? backImage;
  @override
  void initState() {
    super.initState();
  }

  void showPickImageBottomSheet(bool isFrontImage) {
    showModalBottomSheet(
      context: context,
      builder: ((context) => Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () => pickImage(false, isFrontImage),
              ),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_rounded),
                title: const Text('Gallery'),
                onTap: () => pickImage(true, isFrontImage),
              ),
            ],
          )),
    );
  }

  void pickImage(bool pikedThroughGallery, bool isFrontImage) async {
    ImagePicker imagePicker = ImagePicker();
    if (pikedThroughGallery) {
      XFile? img = await imagePicker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        setState(() {
          isFrontImage ? frontImage = img : backImage = img;
        });
      }
    } else {
      XFile? img = await imagePicker.pickImage(source: ImageSource.camera);

      if (img != null) {
        setState(() {
          isFrontImage ? frontImage = img : backImage = img;
        });
      }
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddServiceProviderLicenseBloc, AddServiceProviderLicenseStateBase>(
      listener: (context, state) {
        if (state is AddServiceProviderLicenseLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is AddServiceProviderLicenseSuccess) {
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
        } else if (state is AddServiceProviderLicenseError) {
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
                          verticalSpacing10,
                          _specialitiesTextBox(),
                          verticalSpacing10,
                          _therapyServicesTextBox(),
                          verticalSpacing10,
                          //    _languagesTextBox(),
                          verticalSpacing20,
                          _divider(),
                          verticalSpacing10,
                          _licenseDetailText(context),
                          verticalSpacing10,
                          _licensingBoardTextField(),
                          verticalSpacing10,
                          _licenseTypeTextBox(),
                          verticalSpacing10,
                          _licenseNumberTextField(),
                          verticalSpacing10,
                          // _licenseStatusTextBox(),
                          // verticalSpacing10,
                          _licenseIssueTextField(),
                          verticalSpacing20,
                          _uploadPhotoslicenseText(context),
                          verticalSpacing20,
                          _frontImage(),
                          verticalSpacing20,
                          _backImage(),
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
        pageNo: '(3 of 3)',
        text: "Education & Specialties Check",
      );

  Widget _therapyServicesTextBox() => Container(
        width: getWidth(MediaQuery.of(context).size.width),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        alignment: Alignment.center,
        child: ListTile(
          onTap: () => Get.bottomSheet(const TherapyTypes()),
          leading: const Icon(
            Icons.medical_services_outlined,
          ),
          title: const Text(
            'Service Type',
          ),
          trailing: const Icon(Icons.arrow_drop_down_sharp),
        ),
      );

  Widget _specialitiesTextBox() => Container(
        width: getWidth(MediaQuery.of(context).size.width),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        alignment: Alignment.center,
        child: ListTile(
          onTap: () => Get.bottomSheet(const ServiceProviderSpecialities()),
          leading: const Icon(Icons.done_outline_sharp),
          title: const Text(
            'Add Specialities',
          ),
          trailing: const Icon(Icons.arrow_drop_down_sharp),
        ),
      );

  //  MyDropDownTextField(
  //       hintText:
  //       onTap: () => Get.bottomSheet(ServiceProviderSpecialities()),
  //       value: dropdownvalue,
  //       icon: ,
  //       validator: (val) {},
  //       onChanged: (newValue) {
  //         setState(() {
  //           dropdownvalue = newValue.toString();
  //         });
  //       },
  //       items: items.map((String items) {
  //         return DropdownMenuItem(
  //           value: items,
  //           child: Text(items),
  //         );
  //       }).toList(),
  //     );

  // Widget _languagesTextBox() => MyDropDownTextField(
  //       hintText: 'Proficient Languages',
  //       value: dropdownvalue,
  //       icon: Icons.language,
  //       validator: (val) {
  //         return null;
  //       },
  //       onChanged: (newValue) {
  //         setState(() {
  //           dropdownvalue = newValue.toString();
  //         });
  //       },
  //       items: items.map((String items) {
  //         return DropdownMenuItem(
  //           value: items,
  //           child: Text(items),
  //         );
  //       }).toList(),
  //     );

  Widget _divider() => SizedBox(
      width: getWidth(MediaQuery.of(context).size.width),
      child: const Divider(color: kBlackColor38));

  Widget _licenseDetailText(BuildContext context) => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'License Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              verticalSpacing10,
            ]),
      );

  Widget _licensingBoardTextField() => MyTextFieldWithNoLogo(
        hintText: "Licensing Board",
        textEditingController: licenseingBoardController,
        //  focusNode: emailFocus,
        // onFieldSubmitted: (val) =>
        //     FocusScope.of(context).requestFocus(passwordFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  // Widget _licenseStatusTextBox() => MyDropDownTextFieldwithNoLogo(
  //       hintText: 'License Status',
  //       value: dropdownvalue,
  //       validator: (val) {
  //         return null;
  //       },
  //       onChanged: (newValue) {
  //         setState(() {
  //           dropdownvalue = newValue.toString();
  //         });
  //       },
  //       items: items.map((String items) {
  //         return DropdownMenuItem(
  //           value: items,
  //           child: Text(items),
  //         );
  //       }).toList(),
  //     );

  Widget _licenseTypeTextBox() =>
      BlocBuilder<GetServiceProviderLicenseTypesBloc, GetServiceProviderLicenseTypesState>(
        builder: (context, state) {
          if (state is GetServiceProviderLicenseTypesLoading) {
          } else if (state is GetServiceProviderLicenseTypesLoaded) {
            if (!state.getLicenseTypeModel.any((e) => e.id == 0)) {
              state.getLicenseTypeModel
                  .insert(0, GetLicenseTypeModel(id: 0, name: 'Please Select'));
            }
            return MyDropDownTextFieldwithNoLogo(
              hintText: 'License Type',
              value: getLicenseTypeModel == null
                  ? state.getLicenseTypeModel.first
                  : getLicenseTypeModel!,
              validator: (val) {
                return null;
              },
              onChanged: (newValue) {
                setState(() {
                  getLicenseTypeModel = state.getLicenseTypeModel
                      .singleWhere((licenseType) => licenseType == newValue);
                });
              },
              items: state.getLicenseTypeModel.map((val) {
                return DropdownMenuItem<GetLicenseTypeModel>(
                  value: val,
                  child: Text(val.name!),
                );
              }).toList(),
            );
          } else if (state is GetServiceProviderLicenseTypesError) {}
          return Container();
        },
      );

  Widget _licenseNumberTextField() => MyTextFieldWithNoLogo(
        hintText: "Licensing Number",
        textEditingController: licenseNumberController,
        focusNode: licenseNumberNode,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(licenseIssueNode),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _licenseIssueTextField() => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MyTextFieldWithNoLogo(
                hintText: "Lic.Issue Date",
                textEditingController: licenseIssueDateController,
                focusNode: licenseIssueNode,
                onFieldSubmitted: (val) =>
                    FocusScope.of(context).requestFocus(licenseExpiryDateNode),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Field is Empty!";
                  }
                  return null;
                },
              ),
            ),
            horizontalSpacing20,
            Expanded(
              child: MyTextFieldWithNoLogo(
                hintText: "Lic.Expiry Date",
                textEditingController: licenseExpiryDateController,
                focusNode: licenseExpiryDateNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Field is Empty!";
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      );

  Widget _signUpButton(BuildContext context) => MyButton(
      textSize: 20,
      width: getWidth(MediaQuery.of(context).size.width),
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      onPressed: () => _submit(),
      buttonText: 'Next');

  Widget _uploadPhotoslicenseText(BuildContext context) => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload photos of license',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: kBlackColor45),
              ),
              verticalSpacing10,
            ]),
      );

  Widget _frontImage() => PickImageWidget(
        text: 'Click to upload front image',
        image: frontImage,
        onTap: () => showPickImageBottomSheet(true),
      );

  Widget _backImage() => PickImageWidget(
        text: 'Click to upload Back image',
        image: backImage,
        onTap: () => showPickImageBottomSheet(false),
      );
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (getLicenseTypeModel?.id == null || getLicenseTypeModel?.id == 0) {
        Get.snackbar("License type is empty!", "Please select a license type");
      } else {
        BlocProvider.of<AddServiceProviderLicenseBloc>(context).add(
          AddServiceProviderLicenseEvent(
            addServiceProviderLicenseModel: AddServiceProviderLicenseModel(
              backImage: "",
              frontImage: "",
              backImageFile: frontImage,
              board: licenseingBoardController.text,
              serviceProviderEmail: "",
              expiryDate: licenseExpiryDateController.text,
              frontImageFile: backImage,
              licenseTypeId: getLicenseTypeModel!.id,
              issueDate: licenseIssueDateController.text,
              number: licenseNumberController.text,
            ),
          ),
        );
      }
      //   if (passwordController.text == confirmPasswordController.text) {
      // } else {
      //   Get.snackbar("Password mismatch", "Password didnot match");
      // }
    }
  }
}

class PickImageWidget extends StatelessWidget {
  PickImageWidget({
    required this.text,
    required this.onTap,
    this.image,
    Key? key,
  }) : super(key: key);
  String text;
  XFile? image;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: image != null
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    onError: (exception, stackTrace) => byDefaultImage,
                    fit: BoxFit.fill,
                    image: FileImage(
                      File(image!.path),
                    ),
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.photo_size_select_actual_rounded,
                    color: kPrimaryColor,
                    size: 50,
                  ),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
        width: getWidth(MediaQuery.of(context).size.width),
      ),
    );
  }
}
