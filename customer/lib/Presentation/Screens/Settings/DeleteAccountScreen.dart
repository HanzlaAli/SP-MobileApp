import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/Routes/Routes.dart';
import '../../Bloc/DeleteAccountBloc/DeleteAccount_bloc.dart';
import '../../Widgets/MyAppBar.dart';
import '../../Widgets/MyButton.dart';
import '../../Widgets/MyTextFieldWithNoLogo.dart';
import '../../helper/Constants.dart';
import '../User/LogIn/LogIn.dart';

class DeleteAccountScreen extends StatelessWidget {
  DeleteAccountScreen({super.key});
  final reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountBloc, DeleteAccountStateBase>(
      listener: (context, state) {
        if (state is DeleteAccountSuccessState) {
          navigatorPushAndRemoveUntil(context, const LogInScreen());
        }
      },
      child: Scaffold(
        appBar: MyAppBar(title: 'Delete Account', isDrawer: false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Are you sure you want to delete your account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Please note that deleting your account will permanently remove all your data, preferences, and interactions from our app. This action cannot be undone.Deleting your account means parting ways not only with our app but also with all your saved preferences, chat history, and any other personalized content. While we genuinely hope you\'ve had a positive experience, we understand that circumstances change, and we respect your choice to move on.If you have any concerns or feedback, we\'d love to hear from you before you proceed with the deletion.',
                ),
                Container(),
                // MyTextFieldWithNoLogo(
                //   textEditingController: reasonController,
                //   validator: (val) {},
                //   hintText: 'Write Reason of Account Deletion',
                // ),
                MyButton(
                  onPressed: () {
                    BlocProvider.of<DeleteAccountBloc>(context)
                        .add(DeleteAccountEvent());
                  },
                  fontColor: kWhiteColor,
                  buttonText: 'Confirm Delete',
                )
              ]),
        ),
      ),
    );
  }
}
