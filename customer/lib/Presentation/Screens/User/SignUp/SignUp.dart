// ignore_for_file: file_names
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../Core/Routes/Routes.dart';
import '../../../../Data/Models/CustomerModel/SetUpProfileModel.dart';
import '../../../../Data/Models/UserModels/SignUpModel.dart';
import '../../../../Presentation/Bloc/SignUpBloc/sign_up_bloc.dart';
import '../../../../Presentation/Widgets/MyButton.dart';
import '../../../../Presentation/Widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Widgets/MyAppBarWidget.dart';
import '../../../helper/Constants.dart';
import '../LogIn/LogIn.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign-up";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final phoneNoController = TextEditingController();

  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final emailFocus = FocusNode();

  final professionFocus = FocusNode();

  final passwordFocus = FocusNode();

  final confirmPasswordFocus = FocusNode();

  final phoneNoFocus = FocusNode();

  final firstnameFocus = FocusNode();

  final lastnameFocus = FocusNode();
  SignUpBloc? signUpBloc;
  XFile? image;

  bool isPasswordHidden = true;

  bool isconfirmPasswordHidden = true;
  @override
  void initState() {
    signUpBloc = BlocProvider.of<SignUpBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    signUpBloc!.close();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is SignUpSuccess) {
          Get.snackbar("Added!", state.successModel!.message!);
          navigatorPush(context, const LogInScreen());
        } else if (state is SignUpError) {
          Get.snackbar("Error!", state.errorModel!.message!);
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: kMaximumWidgth,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _appIcon(),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          _headerText(context),
                          verticalSpacing20,
                          _profilePicture(),
                          verticalSpacing20,
                          _firstnameTextField(),
                          verticalSpacing20,
                          _lastnameTextField(),
                          verticalSpacing20,
                          _emailTextField(),
                          verticalSpacing20,
                          _phoneTextField(),
                          verticalSpacing20,
                          _passwordTextField(),
                          verticalSpacing20,
                          _confirmPasswordTextField(),
                          verticalSpacing10,
                        ],
                      ),
                    ),
                    verticalSpacing10,
                    _signUpButton(),
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
        pageNo: '',
      );

  Widget _headerText(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Mended Solutions',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'join this app to find the best person for your work',
                style: TextStyle(
                    color: kBlackColor38, fontWeight: FontWeight.bold),
              ),
            ]),
      );

  Widget _profilePicture() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image == null
                ? const CircleAvatar(
                    backgroundColor: Colors.black26,
                    radius: 50,
                    child: byDefaultImage,
                  )
                : Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: kBlueAccentColor),
                    child: CircleAvatar(
                      radius: 60,
                      onBackgroundImageError: (exception, stackTrace) =>
                          byDefaultImage,
                      backgroundImage: FileImage(
                        File(image!.path),
                      ),
                      child: byDefaultImage,
                    ),
                  ),
            //  ),
            // horizontalSpacing20,

            // const CircleAvatar(
            //   radius: 60,
            //   backgroundColor: Colors.black12,
            //   child: Icon(
            //     Icons.person,
            //     color: kWhiteColor,
            //     size: 80,
            //   ),
            //   ),

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

  Widget _firstnameTextField() => MyTextField(
        hintText: "First Name",
        textEditingController: firstnameController,
        icon: Icons.person_outline_sharp,
        focusNode: firstnameFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(lastnameFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _lastnameTextField() => MyTextField(
        hintText: "Last Name",
        textEditingController: lastnameController,
        icon: Icons.person_outline_sharp,
        focusNode: lastnameFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(professionFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _emailTextField() => MyTextField(
        hintText: "Email Address",
        textEditingController: emailController,
        icon: Icons.email_outlined,
        focusNode: emailFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(phoneNoFocus),
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

  Widget _phoneTextField() => MyTextField(
        hintText: "Phone No",
        textEditingController: phoneNoController,
        icon: Icons.phone,
        focusNode: phoneNoFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(passwordFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.phone,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  Widget _passwordTextField() => MyTextField(
        hintText: "Password",
        textEditingController: passwordController,
        icon: Icons.lock_outlined,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(confirmPasswordFocus),
        focusNode: passwordFocus,
        obscureText: isPasswordHidden,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            child: isPasswordHidden
                ? const Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: kPrimaryColor,
                  )),
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          } else if (val.length <= 5) {
            return "Length must be greater than 5";
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
      );

  Widget _confirmPasswordTextField() => MyTextField(
        textEditingController: confirmPasswordController,
        icon: Icons.done,
        hintText: "Confirm Password",
        focusNode: confirmPasswordFocus,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isconfirmPasswordHidden = !isconfirmPasswordHidden;
              });
            },
            child: isconfirmPasswordHidden
                ? const Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: kPrimaryColor,
                  )),
        obscureText: isconfirmPasswordHidden,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          } else if (val.length <= 5) {
            return "Length must be greater than 5";
          } else if (confirmPasswordController.text !=
              passwordController.text) {
            return "Password didnot match";
          }
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
      );

  Widget _signUpButton() => MyButton(
      textSize: 20,
      fontColor: kWhiteColor,
      bgColor: kPrimaryColor,
      onPressed: () => _submit(),
      buttonText: 'SignUp');

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (passwordController.text == confirmPasswordController.text) {
        BlocProvider.of<SignUpBloc>(context).add(NewUserAccount(
            setUpCustomerProfileModel:
                SetUpCustomerProfileModel(profilePictureFile: image),
            signUpModel: SignUpModel(
                user: User(
                    email: emailController.text,
                    firstName: firstnameController.text,
                    lastName: lastnameController.text,
                    id: 0,
                    phoneNumber: phoneNoController.text),
                password: passwordController.text)));
      } else {
        Get.snackbar("Password mismatch", "Password didnot match");
      }
    }
  }
}
