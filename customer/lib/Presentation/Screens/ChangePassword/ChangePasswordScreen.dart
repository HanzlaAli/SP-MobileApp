import 'package:flutter/material.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyTextFieldWithNoLogo.dart';
import '../../helper/Constants.dart';
import 'NewPasswordScreen.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final oldPasswordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Change Password', isDrawer: false),
      body: Form(
        key: _key,
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
                    'To change your password please type your password first',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            verticalSpacing10,
            MyTextFieldWithNoLogo(
              textEditingController: oldPasswordController,
              validator: (val) {
                if (val == null || val == "") {
                  return "Field is Empty";
                }
                return null;
              },
              hintText: 'Enter Current passowrd',
            ),
            verticalSpacing20,
            verticalSpacing20,
            MyButton(
              fontColor: kWhiteColor,
              buttonText: 'Next',
              onPressed: () {
                if (_key.currentState!.validate()) {
                  navigatorPush(
                      context,
                      NewPasswordChangeScreen(
                        currentPassword: oldPasswordController.text,
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
