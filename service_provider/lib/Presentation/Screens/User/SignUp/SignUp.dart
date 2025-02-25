// ignore_for_file: file_names, non_constant_identifier_names
import '../../../../Core/Routes/Routes.dart';
import '../../../../Presentation/Bloc/SignUpBloc/sign_up_bloc.dart';
import '../../../../Presentation/Screens/User/SignUp/SignUp2.dart';
import '../../../../Presentation/Widgets/MyAppBarWidget.dart';
import '../../../../Presentation/Widgets/MyButton.dart';
import '../../../../Presentation/Widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../helper/Constants/Constants.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../../helper/Constants/MySpaces.dart';
import '../../../../Data/Models/UserModels/SignUpModel.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/sign-up";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpBloc? signUpBloc;
  int id = 0;

  final _formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();

  final lastNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final professionController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final phoneNoController = TextEditingController();

  final emailFocus = FocusNode();

  final professionFocus = FocusNode();

  final passwordFocus = FocusNode();

  final confirmPasswordFocus = FocusNode();

  final phoneNoFocus = FocusNode();

  final nameFocus = FocusNode();
  final firstNameFocus = FocusNode();

  final lastNameFocus = FocusNode();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String password = pass.trim();
    if (pass_valid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  bool isPasswordHidden = true;

  bool isConfirmPasswordHidden = true;

  @override
  void initState() {
    signUpBloc = BlocProvider.of<SignUpBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    // emailController.dispose();
    // passwordController.dispose();
    // confirmPasswordController.dispose();
    // passwordController.dispose();
    // emailFocus.dispose();
    // passwordFocus.dispose();
    // confirmPasswordFocus.dispose();
    // nameFocus.dispose();
    signUpBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is SignUpSuccess) {
          Get.snackbar("Added!", state.successModel!.message!);
          navigatorPush(context, const SignUp2());
        } else if (state is SignUpError) {
          Get.snackbar("Opps!", state.errorModel!.message!);
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
                          verticalSpacing10,
                          _firstNameTextField(),
                          verticalSpacing20,
                          _lastNameTextField(),
                          verticalSpacing20,
                          //     _professionTextField(),
                          //     verticalSpacing20,
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
                    verticalSpacing10,
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
              verticalSpacing10,
              Text(
                'Join our diverse network of dedicated service providers.',
                style: TextStyle(
                    color: kBlackColor38, fontWeight: FontWeight.bold),
              ),
            ]),
      );

  Widget _firstNameTextField() => MyTextField(
        hintText: "First Name",
        textEditingController: firstnameController,
        icon: Icons.person_outline_sharp,
        focusNode: nameFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(lastNameFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );
  Widget _lastNameTextField() => MyTextField(
        hintText: "Last Name",
        textEditingController: lastNameController,
        icon: Icons.person_outline_sharp,
        focusNode: lastNameFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(emailFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (val!.isEmpty) {
            return "Field is Empty!";
          }
          return null;
        },
      );

  // Widget _professionTextField() => MyTextField(
  //       hintText: "Profession",
  //       textEditingController: professionController,
  //       icon: Icons.library_books_sharp,
  //       focusNode: professionFocus,
  //       onFieldSubmitted: (val) =>
  //           FocusScope.of(context).requestFocus(emailFocus),
  //       textInputAction: TextInputAction.next,
  //       keyboardType: TextInputType.text,
  //       validator: (val) {
  //         if (val!.isEmpty) {
  //           return "Field is Empty!";
  //         } else if (!val.isEmail) {
  //           return "Invalid Email";
  //         }
  //         return null;
  //       },
  //     );

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
          } else if (!val.isPhoneNumber) {
            return "Invalid Phone";
          }
          return null;
        },
      );

  Widget _passwordTextField() => MyTextField(
        hintText: "Password",
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
            child: isPasswordHidden
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        textEditingController: passwordController,
        icon: Icons.lock_outlined,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(confirmPasswordFocus),
        focusNode: passwordFocus,
        obscureText: isPasswordHidden,
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
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isConfirmPasswordHidden = !isConfirmPasswordHidden;
              });
            },
            child: isConfirmPasswordHidden
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        icon: Icons.done,
        hintText: "Confirm Password",
        focusNode: confirmPasswordFocus,
        obscureText: isConfirmPasswordHidden,
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
      buttonText: 'Next');

  void clear() {
    firstnameController.text = "";
    lastNameController.text = "";
    passwordController.text = "";
    phoneNoController.text = "";
    id = 0;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (passwordController.text == confirmPasswordController.text) {
        BlocProvider.of<SignUpBloc>(context).add(NewServiceProviderAccount(
            signUpModel: SignUpModel(
                user: User(
                  email: emailController.text,
                  lastName: lastNameController.text,
                  id: id,
                  phoneNumber: phoneNoController.text,
                  firstName: firstnameController.text,
                ),
                password: passwordController.text)));
        clear();
      } else {
        Get.snackbar("Password mismatch", "Password didnot match");
      }
    }
  }
}
