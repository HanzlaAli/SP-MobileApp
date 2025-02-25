// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../Core/Routes/Routes.dart';
import '../../../../Data/Models/VerificationModels/OtpModel.dart';
import '../../../Bloc/VerifyOtpBloc/verify_otp_bloc.dart';
import '../../../helper/Constants.dart';
import '../../../helper/ReusedFunctions.dart';
import 'NewPasswordScreen.dart';

class OtpScreen extends StatelessWidget {
  static const routeName = '/otp-screen';
  OtpScreen({super.key});
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpBloc, VerifyOtpStateBase>(
      listener: (context, state) {
        if (state is VerifyOtpLoading) {
          Get.snackbar("Loading...", "Please wait");
        } else if (state is VerifyOtpSuccess) {
          Get.snackbar("Success", "Otp Verified!");
          navigatorPushAndRemoveUntil(
              context,
              NewPasswordScreen(
                otp: otpController.text,
              ));
        } else if (state is VerifyOtpError) {
          Get.snackbar("Error!", "Something went wrong Please try again later");
        }
      },
      child: Scaffold(
        body: Container(
          height: kIsWeb ? Get.height : Get.height * 0.6,
          width: Get.width,
          margin: const EdgeInsets.only(top: 80),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _headerText(context),
                _image(context),
                _otpTextBox(context),
              ]),
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
            'Verification!',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          verticalSpacing10,
          Text(
            'Enter the verification code we just sent you on your email address',
            textAlign: TextAlign.center,
            style: TextStyle(color: kBlackColor38, fontWeight: FontWeight.bold),
          ),
        ]),
      );
  Widget _image(BuildContext context) => SvgPicture.asset(
        'assets/Images/verification-icon.svg',
        height: MediaQuery.of(context).size.height * 0.3,
      );
  Widget _otpTextBox(BuildContext context) => Container(
        width: getWidth(MediaQuery.of(context).size.width),
        color: Colors.transparent,
        margin: const EdgeInsets.all(20),
        child: PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.slide,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 25,
            activeFillColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          //  backgroundColor: Colors.white,
          //enableActiveFill: true,
          // errorAnimationController: errorController,
          controller: otpController,
          onCompleted: (v) {
            BlocProvider.of<VerifyOtpBloc>(context).add(VerifyOtpEvent(
                otpModel: OtpModel(
              otp: otpController.text,
            )));
          },

          beforeTextPaste: (text) {
            return true;
          },
          appContext: context, onChanged: (String value) {},
        ),
      );

  // OTPTextField(
  //       length: 6,
  //       width: MediaQuery.of(context).size.width,
  //       fieldWidth: 50,
  //       style: const TextStyle(fontSize: 17),
  //       textFieldAlignment: MainAxisAlignment.spaceAround,
  //       fieldStyle: FieldStyle.box,
  //       onCompleted: (pin) {
  //       },
  //     );
}
