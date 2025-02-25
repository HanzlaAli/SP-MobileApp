import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/ChangePasswordBloc/changePassword_bloc.dart';
import '../../Bloc/UserModels/ChangePasswordModel.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyTextFieldWithNoLogo.dart';
import '../../helper/Constants.dart';
import 'PasswordChangedSccessfully.dart';

class NewPasswordChangeScreen extends StatelessWidget {
  NewPasswordChangeScreen({super.key, required this.currentPassword});
  String currentPassword;
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordStateBase>(
      listener: (context, state) {
        if (state is ChangePasswordSuccessState) {
          navigatorPush(context, const PasswordChanged());
        }
      },
      child: Scaffold(
        appBar: MyAppBar(title: 'Change Password', isDrawer: false),
        body: Form(
          key: _key,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Set New Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                verticalSpacing10,
                MyTextFieldWithNoLogo(
                  textEditingController: newPasswordController,
                  validator: (val) {
                    if (val == null || val == "") {
                      return "Field is Empty";
                    }
                    return null;
                  },
                  hintText: 'Enter New passowrd',
                ),
                verticalSpacing10,
                MyTextFieldWithNoLogo(
                  textEditingController: confirmPasswordController,
                  validator: (val) {
                    if (val == null || val == "") {
                      return "Field is Empty";
                    } else if (val != newPasswordController.text) {
                      return "Password didn't match";
                    }
                    return null;
                  },
                  hintText: 'Enter Confirm passowrd',
                ),
                verticalSpacing20,
                MyButton(
                  fontColor: kWhiteColor,
                  buttonText: 'Change',
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      BlocProvider.of<ChangePasswordBloc>(context).add(
                          ChangePasswordEvent(
                              changePasswordModel: ChangePasswordModel(
                                  currentPassword: currentPassword,
                                  newPassword: newPasswordController.text)));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
