// ignore_for_file: must_be_immutable, file_names
import 'dart:io';
import '../../../Data/Models/ProfileModels/ServiceProviderProfileModel.dart';
import '../../../Presentation/Widgets/EditSpecialities.dart';
import '../../../Presentation/Widgets/EditTherapyType.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../Bloc/SetUpProfileBloc/set_up_profile_bloc.dart';
import '../../helper/Constants/Constants.dart';
import '../../helper/Constants/MyColors.dart';
import '../../helper/Constants/MyIcons.dart';
import '../../helper/Constants/MySpaces.dart';
import '../../../Data/Models/LicenseModels/AddServiceProviderLicense.dart';
import '../../../Data/Models/LicenseModels/GetLicenseTypeModel.dart';
import '../../Bloc/AddServiceProviderLicenseBloc/add_serviceProvider_license_bloc.dart';
import '../../Bloc/GetServiceProviderLicenseTypeBloc/get_serviceProvider_license_types_bloc.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyDropdownWithNoLogo.dart';
import '../../Widgets/MyTextFieldWithNoLogo.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key, required this.serviceProviderProfileModel});
  ServiceProviderProfileModel serviceProviderProfileModel;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  XFile? image;
  XFile? frontImage;
  XFile? backImage;

  final licenseingBoardController = TextEditingController();

  final licenseNumberController = TextEditingController();

  final licenseIssueDateController = TextEditingController();

  final licenseExpiryDateController = TextEditingController();

  final licenseingBoardNode = FocusNode();

  final licenseNumberNode = FocusNode();

  final licenseIssueNode = FocusNode();

  final licenseExpiryDateNode = FocusNode();

  GetLicenseTypeModel? getLicenseTypeModel;
  @override
  void initState() {
    licenseingBoardController.text =
        widget.serviceProviderProfileModel.serviceProviderLicense!.board!;
    licenseNumberController.text =
        widget.serviceProviderProfileModel.serviceProviderLicense!.number!;
    licenseIssueDateController.text =
        widget.serviceProviderProfileModel.serviceProviderLicense!.issueDate!;

    licenseExpiryDateController.text =
        widget.serviceProviderProfileModel.serviceProviderLicense!.expiryDate!;
    super.initState();
  }

  void pickImage(bool pikedThroughGallery, bool isProfile, bool isBack) async {
    ImagePicker imagePicker = ImagePicker();

    XFile? img;
    if (pikedThroughGallery) {
      img = await imagePicker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        if (!isProfile) {
          if (isBack) {
            backImage = img;
          } else {
            frontImage = img;
          }
        } else {
          image = img;
        }
      }
    } else {
      img = await imagePicker.pickImage(source: ImageSource.camera);
      if (img != null) {
        if (!isProfile) {
          if (isBack) {
            backImage = img;
          } else {
            frontImage = img;
          }
        } else {
          image = img;
        }
      }
    }

    setState(() {});

    if (img != null && isProfile == true) {
      BlocProvider.of<SetUpProfileBloc>(context).add(
        UpdateProfilePicture(
          img: File(img.path),
        ),
      );
    }
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<GetProfileBloc>(context).add(
        GetServiceProviderProfileEvent(),
      );
    });
    Get.back();
  }

  void showPickImageBottomSheet(
      {bool? isProfile = false, bool isback = false}) {
    showModalBottomSheet(
      context: context,
      builder: ((context) => Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Camera'),
                onTap: () => pickImage(false, isProfile!, isback),
              ),
              ListTile(
                leading: const Icon(Icons.photo_size_select_actual_rounded),
                title: const Text('Gallery'),
                onTap: () => pickImage(true, isProfile!, isback),
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddServiceProviderLicenseBloc, AddServiceProviderLicenseStateBase>(
      listener: (context, state) {
        if (state is AddServiceProviderLicenseSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: MyAppBar(
          isDrawer: false,
          // onBackButtonTap: () {
          //   BlocProvider.of<GetProfileBloc>(context).add(GetServiceProviderProfileEvent());
          //   Get.back();
          // },
          // editOption: false,
          title: 'Edit Profile',
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: kMaximumWidgth,
            child: Column(children: [
              _profilePicture(),
              verticalSpacing20,
              _therapyServicesTextBox(),
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
              _licenseIssueTextField(),
              verticalSpacing20,
              _uploadPhotoslicenseText(context),
              verticalSpacing20,
              _frontImage(widget.serviceProviderProfileModel.serviceProviderLicense!.frontImage!),
              verticalSpacing20,
              _backImage(widget.serviceProviderProfileModel.serviceProviderLicense!.backImage!),
              verticalSpacing20,
              verticalSpacing20,
              _signUpButton(context),
              verticalSpacing20,
            ]),
          ),
        ),
      ),
    );
  }

  Widget _therapyServicesTextBox() => Container(
        width: Get.width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        alignment: Alignment.center,
        child: ListTile(
          onTap: () => Get.bottomSheet(EditTherapyTypes(
            model: widget.serviceProviderProfileModel.serviceProviderTherapies!,
          )),
          leading: const Icon(
            Icons.medical_services_outlined,
          ),
          title: const Text(
            'Service Type',
          ),
          trailing: const Icon(Icons.arrow_drop_down_sharp),
        ),
      );

  Widget _profilePicture() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: kBlueAccentColor),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black12,
                backgroundImage:
                    NetworkImage(widget.serviceProviderProfileModel.profilePicture!),
                //image == null
                // ? byDefaultImage
                // : Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(40),
                //       image: DecorationImage(
                //         onError: (exception, stackTrace) => byDefaultImage,
                //         fit: BoxFit.fill,
                //         image: FileImage(
                //           File(image!.path),
                //         ),
                //       ),
                //     ),
                //   ),
              ),
            ),
            horizontalSpacing20,

            // const CircleAvatar(
            //   radius: 60,
            //   backgroundColor: Colors.black12,
            //   child: Icon(
            //     Icons.person,
            //     color: kWhiteColor,
            //     size: 80,
            //   ),
            // ),

            verticalSpacing10,
            ElevatedButton(
              style: ButtonStyle(backgroundColor: materialGreenColor),
              onPressed: () => showPickImageBottomSheet(isProfile: true),
              child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: const Text('Upload',style: TextStyle(color: kWhiteColor),)),
            ),
          ],
        ),
      );

  Widget _divider() => SizedBox(
      width: Get.width * 0.86, child: const Divider(color: kBlackColor38));

  Widget _licenseDetailText(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'License Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
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
        width: Get.width * 0.8,
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
      width: MediaQuery.of(context).size.width * 0.8,
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      onPressed: () => _submit(),
      buttonText: 'Submit');

  Widget _uploadPhotoslicenseText(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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

  Widget _frontImage(String path) => PickImageWidget(
        text: 'Click to upload front image',
        image: frontImage,
        path: path,
        onTap: () => showPickImageBottomSheet(isProfile: false, isback: false),
      );

  Widget _backImage(String path) => PickImageWidget(
        text: 'Click to upload Back image',
        image: backImage,
        path: path,
        onTap: () => showPickImageBottomSheet(isProfile: false, isback: true),
      );
  void _submit() {
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    BlocProvider.of<AddServiceProviderLicenseBloc>(context).add(
      UpdateServiceProviderLicenseEvent(
        addServiceProviderLicenseModel: AddServiceProviderLicenseModel(
          backImage: "",
          frontImage: "",
          backImageFile: backImage,
          board: licenseingBoardController.text,
          serviceProviderEmail: "",
          expiryDate: licenseExpiryDateController.text,
          frontImageFile: frontImage,
          licenseTypeId: getLicenseTypeModel?.id ??
              widget.serviceProviderProfileModel.serviceProviderLicense?.licenseType?.id,
          issueDate: licenseIssueDateController.text,
          number: licenseNumberController.text,
        ),
        id: widget.serviceProviderProfileModel.serviceProviderLicense!.id!,
      ),
    );
    Future.delayed(
      const Duration(seconds: 2),
      () {
        BlocProvider.of<GetProfileBloc>(context).add(
          GetServiceProviderProfileEvent(),
        );
      },
    );
    //   if (passwordController.text == confirmPasswordController.text) {
    // } else {
    //   Get.snackbar("Password mismatch", "Password didnot match");
    // }
  }
}

//}
class PickImageWidget extends StatelessWidget {
  PickImageWidget({
    required this.text,
    required this.onTap,
    this.image,
    this.path = "",
    Key? key,
  }) : super(key: key);
  String text;
  XFile? image;
  String path;

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
        // ignore: sort_child_properties_last
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
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      onError: (exception, stackTrace) => byDefaultImage,
                      fit: BoxFit.fill,
                      image: NetworkImage(path)),
                ),
              ),
        width: Get.width * 0.8,
      ),
    );
  }
}
