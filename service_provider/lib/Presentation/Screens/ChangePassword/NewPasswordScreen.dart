import '../../../Data/Models/UserModels/ChangePasswordModel.dart';
import '../../../Presentation/Widgets/MyAppBar.dart';
import '../../../Presentation/Widgets/MyTextFieldWithNoLogo.dart';
import '../../../Presentation/helper/Constants/MySpaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/ChangePasswordBloc/changePassword_bloc.dart';
import '../../Widgets/MyButton.dart';
import '../../helper/Constants/MyColors.dart';
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
                  bgColor: kPrimaryColor,
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
