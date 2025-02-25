// ignore_for_file: file_names, must_be_immutable, use_build_context_synchronously
import 'dart:io';
import 'package:customer/Presentation/Bloc/SetCustomerProfileBloc/set_customer_profile_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Core/Routes/Routes.dart';
import '../../../Presentation/Bloc/GetUserProfileBloc/get_user_profile_bloc.dart';
import '../../../Presentation/Screens/ErrorHandling/InternalServerErrorScreen.dart';
import '../../../Presentation/Screens/User/LogIn/LogIn.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Data/Models/CustomerModel/UpdateProfileModel.dart';
import '../../helper/Constants.dart';
import '../../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import '../../Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import '../../Bloc/LogOutBloc/log_out_bloc.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyDrawer.dart';
import '../../Widgets/MyTextField.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<GetUserProfileBloc>(context).add(GetUserProfileEvent());
    super.initState();
  }

  int? id;

  final emailController = TextEditingController();

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final phoneController = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Profile'),
      drawer: const MyDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<GetUserProfileBloc>(context)
              .add(GetUserProfileEvent());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<GetUserProfileBloc, GetUserProfileStateBase>(
              builder: ((context, state) {
                if (state is GetUserProfileLoading) {
                  return kCircularProgressIndicator;
                } else if (state is GetUserProfileLoaded) {
                  var data = state.customerProfileModel;
                  id = data?.user?.id;
                  firstNameController.text = data!.user!.firstName ?? "";
                  lastNameController.text = data.user!.lastName ?? "";
                  emailController.text = data.user!.email ?? "";
                  phoneController.text = data.user!.phoneNumber ?? "";
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpacing20,
                      verticalSpacing20,
                      _profilePicture(data.profilePicture!),
                      verticalSpacing20,
                      _firstNameTextField(),
                      verticalSpacing10,
                      _lastNameTextField(),
                      verticalSpacing10,
                      _emailTextField(),
                      verticalSpacing10,
                      _phoneTextField(),
                      verticalSpacing10,
                      // _DOBTextField(data.user.),
                      verticalSpacing20,
                      _update(context),
                      verticalSpacing20,
                      _logOut(context),
                      verticalSpacing20,
                    ],
                  );
                } else if (state is GetUserProfileError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Center(
                        child: InternalServerErrorScreen(),
                      ),
                    ],
                  );
                }
                return Container();
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profilePicture(String imagePath) => Center(
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
                    //   AssetImage('assets/Images/ProfileImageDoc.jpeg'),
                    (image == null)
                        ? NetworkImage(imagePath)
                        : FileImage(
                            File(image!.path),
                          ) as ImageProvider,
                // onBackgroundImageError: (exception, stackTrace) => kErrorImage,
                // child: byDefaultImage,
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
              onPressed: () => showPickImageBottomSheet(),
              child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: const Text('Upload',style: TextStyle(color: kWhiteColor),)),
            ),
          ],
        ),
      );

  Widget _firstNameTextField() => MyTextField(
        hintText: "First Name",
        textEditingController: firstNameController,
        icon: Icons.person,
        //  focusNode: emailFocus,
        //  onFieldSubmitted: (val) =>
        //       FocusScope.of(context).requestFocus(passwordFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        fillColor: kWhiteColor,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          } else if (!val.isEmail) {
            return "Invalid Email";
          }
          return null;
        },
      );

  Widget _lastNameTextField() => MyTextField(
        hintText: "Last Name",
        textEditingController: lastNameController,
        icon: Icons.person,
        //  focusNode: emailFocus,
        //  onFieldSubmitted: (val) =>
        //       FocusScope.of(context).requestFocus(passwordFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        fillColor: kWhiteColor,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          } else if (!val.isEmail) {
            return "Invalid Email";
          }
          return null;
        },
      );

  Widget _emailTextField() => MyTextField(
        hintText: "Email Address",
        textEditingController: emailController,
        icon: Icons.email,
        //  focusNode: emailFocus,
        //  onFieldSubmitted: (val) =>
        //       FocusScope.of(context).requestFocus(passwordFocus),
        fillColor: kWhiteColor,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        // enabled: false,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          } else if (!val.isEmail) {
            return "Invalid Email";
          }
          return null;
        },
      );

  Widget _phoneTextField() => MyTextField(
        hintText: "Phone",
        textEditingController: phoneController,
        icon: Icons.phone,
        //  focusNode: emailFocus,
        //  onFieldSubmitted: (val) =>
        //       FocusScope.of(context).requestFocus(passwordFocus),
        fillColor: kWhiteColor,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          } else if (!val.isEmail) {
            return "Invalid Email";
          }
          return null;
        },
      );

  Widget _update(BuildContext context) => MyButton(
      textSize: 20,
      width: kIsWeb ? Get.width * 0.3 : MediaQuery.of(context).size.width * 0.8,
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      onPressed: () => _submit(),
      buttonText: 'Update');

  Widget _logOut(BuildContext context) => TextButton(
        onPressed: () {
          navigatorPushAndRemoveUntil(context, const LogInScreen());
          BlocProvider.of<LogOutBloc>(context).add(LogOutEvent());
          BlocProvider.of<ActiveNotActiveUserBloc>(context)
              .add(UserNonActive());
        },
        child: const Text(
          'Log Out',
          style: TextStyle(color: Colors.red, fontSize: 15),
        ),
      );

  void pickImage(bool pikedThroughGallery) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? img;
    if (pikedThroughGallery) {
      img = await imagePicker.pickImage(source: ImageSource.gallery);
      if (img != null) {
        setState(() {
          image = img;
        });
      }
    } else {
      img = await imagePicker.pickImage(source: ImageSource.camera);
      if (img != null) {
        setState(() {
          image = img;
        });
      }
    }
    if (img != null) {
      BlocProvider.of<SetCustomerProfileBloc>(context).add(
          SetCustomerProfileEvent(
              setUpCustomerProfileModel: SetUpCustomerProfileModel(
                  userEmail: emailController.text, profilePictureFile: image)));
      Future.delayed(const Duration(seconds: 2), () {
        BlocProvider.of<GetUserProfileBloc>(context).add(GetUserProfileEvent());
      });
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

  void _submit() {
    BlocProvider.of<SetCustomerProfileBloc>(context).add(
      UpdateCustomerProfileEvent(
        updateProfileModel: UpdateProfileModel(
          user: User(
              email: emailController.text,
              firstName: firstNameController.text,
              id: id,
              lastName: lastNameController.text,
              phoneNumber: phoneController.text),
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<GetUserProfileBloc>(context).add(GetUserProfileEvent());
    });
  }
}
