import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Core/Routes/Routes.dart';
import '../../../../Data/Models/VerificationModels/ForgetPasswordModel.dart';
import '../../../Bloc/ForgetPasswordBloc/forget_password_bloc.dart';
import '../../../Widgets/MyAppBarWidget.dart';
import '../../../Widgets/MyButton.dart';
import '../../../Widgets/MyButtonWithText.dart';
import '../../../Widgets/MyTextField.dart';
import '../../../helper/Constants.dart';
import '../LogIn/LogIn.dart';
import 'OtpScreen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const routeName = '/forget-password';
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  ForgetPasswordBloc? forgetPasswordBloc;
  @override
  void initState() {
    forgetPasswordBloc = BlocProvider.of<ForgetPasswordBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordError) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is ForgetPasswordSuccess) {
          Get.snackbar("LoggedIn!", "Otp sent to your email");
          navigatorPushAndRemoveUntil(context, OtpScreen());
        } else if (state is ForgetPasswordError) {
          Get.snackbar("Error!", state.errorModel!.message!);
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpacing10,
                      _backArrow(),
                      _headerText(context),
                      _img(context),
                      _emailTextField(),
                      verticalSpacing20,
                      _logInButton(),
                      verticalSpacing20,
                      _myBotton(),
                      verticalSpacing20,
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _backArrow() => MyAppBarWidget(
        pageNo: '',
      );

  Widget _headerText(BuildContext context) => Container(
        height: 100,
        padding: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.8,
        child: const Column(children: [
          Text(
            'Forget your pasword?',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          verticalSpacing10,
          Text(
            'Enter your registered email below \n To recive password reset instruction',
            textAlign: TextAlign.center,
            style: TextStyle(color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
        ]),
      );

  Widget _myBotton() => MyButton(
        buttonText: 'Send',
        bgColor: kPrimaryColor,
        textSize: 15,
        onPressed: () => _submit(),
        fontColor: kWhiteColor,
      );

  Widget _img(BuildContext context) => SizedBox(
        height: 350,
        child: SvgPicture.asset(
          'assets/Images/forgetPass.svg',
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      );

  Widget _emailTextField() => MyTextField(
      icon: Icons.email_outlined,
      textInputColor: kBlackColor38,
      hintText: 'Email Address',
      textEditingController: emailController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty!";
        } else if (!val.isEmail) {
          return "Invalid Email";
        }
        return null;
      });

  Widget _logInButton() => MyButtonWithText(
      buttonTextColor: kPrimaryColor,
      textColor: kBlackColor,
      text: 'Already have an account?',
      buttonText: 'Login',
      onPressed: () => navigatorPush(context, const LogInScreen()));

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      forgetPasswordBloc!.add(RequestForChangePassword(
          forgetPasswordModel:
              ForgetPasswordModel(email: emailController.text)));
    }
  }
}
