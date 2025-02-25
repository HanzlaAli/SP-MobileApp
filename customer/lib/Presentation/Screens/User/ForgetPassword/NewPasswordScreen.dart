// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../Core/Routes/Routes.dart';
import '../../../../Data/Models/VerificationModels/AddNewPasswordModel.dart';
import '../../../Bloc/ForgetPasswordBloc/forget_password_bloc.dart';
import '../../../Widgets/MyButton.dart';
import '../../../Widgets/MyTextField.dart';
import '../../../helper/Constants.dart';
import '../LogIn/LogIn.dart';

class NewPasswordScreen extends StatefulWidget {
  static const routeName = '/new-password';
  NewPasswordScreen({super.key, this.otp});
  String? otp;
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  ForgetPasswordBloc? forgetPasswordBloc;
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
          Get.snackbar("LoggedIn!", state.successModel!.message!);
          navigatorPushAndRemoveUntil(context, const LogInScreen());
        } else if (state is ForgetPasswordError) {
          Get.snackbar("Error!", state.errorModel!.message!);
        }
      },
      child: Form(
        key: _formKey,
        child: SafeArea(
          child: Scaffold(
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: ((context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpacing10,
                      _headerText(context),
                      _img(context),
                      _passwordTextField(),
                      verticalSpacing10,
                      _confirmPasswordTextField(),
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

  Widget _headerText(BuildContext context) => Container(
        height: 100,
        padding: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width * 0.8,
        child: const Column(children: [
          Text(
            'New Password',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          verticalSpacing10,
          Text(
            'Enter new password for your account',
            textAlign: TextAlign.center,
            style: TextStyle(color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
        ]),
      );

  Widget _myBotton() => MyButton(
        buttonText: 'Submit',
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

  Widget _passwordTextField() => MyTextField(
      icon: Icons.lock_outline,
      fillColor: kPrimaryColor,
      obscureText: true,
      textInputColor: kBlackColor38,
      textEditingController: passwordController,
      hintText: 'Password',
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty!";
        }
        return null;
      });
  Widget _confirmPasswordTextField() => MyTextField(
      icon: Icons.done,
      fillColor: kPrimaryColor,
      obscureText: true,
      textInputColor: kBlackColor38,
      hintText: 'Confirm Password',
      textEditingController: confirmPasswordController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Field is Empty!";
        } else if (passwordController.text != confirmPasswordController.text) {
          return 'Password didn\'t match';
        }
        return null;
      });

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      forgetPasswordBloc!.add(
        AddNewPassword(
          addNewPasswordModel: AddNewPasswordModel(
              // otp: widget.otp,
              password: passwordController.text),
        ),
      );
    }
  }
}
