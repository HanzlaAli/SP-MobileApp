// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:mended_soluctions/Presentation/Bloc/GetProfileBloc/get_profile_bloc.dart';
import '../../../../Core/Routes/Routes.dart';
import '../../../helper/Constants/Constants.dart';
import '../../../helper/Constants/MyAlignments.dart';
import '../../../helper/Constants/MyColors.dart';
import '../../../helper/Constants/MySpaces.dart';
import '../../../helper/ReusedFunctions.dart';
import '../../../../Data/Models/UserModels/LogInModel.dart';
import '../../../../Presentation/Bloc/LogInBloc/log_in_bloc.dart';
import '../../../../Presentation/Screens/User/ForgetPassword/ForgetPassword.dart';
import '../../../../Presentation/Screens/User/SignUp/SignUp.dart';
import '../../../../Presentation/Widgets/MyButton.dart';
import '../../../../Presentation/Widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../Bloc/ActiveNotActiveUserBloc/active_not_active_user_bloc.dart';
import '../../../Bloc/RememberMeBloc/remember_me_bloc.dart';
import '../../../Widgets/MyAppIcon.dart';
import '../../../Widgets/MyButtonWithText.dart';
import '../../../Widgets/MyTextButton.dart';
import '../../Home/Home.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = "/log-in";
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _checkBoxOnchanged = false;

  final _formKey = GlobalKey<FormState>();

  final emailFocus = FocusNode();

  final passwordFocus = FocusNode();
  LogInBloc? logInBloc;
  @override
  void initState() {
    BlocProvider.of<RememberMeBloc>(context).add(GetRememberMe());
    logInBloc = BlocProvider.of<LogInBloc>(context);
    super.initState();
  }

  bool isPasswordHidden = true, isLogInLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<RememberMeBloc, RememberMeState>(
      listener: (context, restate) {
        if (restate is RememberMeLoaded) {
          emailController.text = restate.email.toString();
          passwordController.text = restate.password.toString();
          setState(() {});
        }
      },
      child: BlocListener<LogInBloc, LogInState>(
        listener: (context, state) {
          if (state is LogInLoading) {
            Get.snackbar("Loading...", "Please wait");
          } else if (state is LogInSuccess) {
            Get.snackbar("LoggedIn!", state.successModel!.message!);
            setState(() {
              isLogInLoading = false;
            });
            BlocProvider.of<GetProfileBloc>(context)
                .add(GetServiceProviderProfileEvent());
            BlocProvider.of<ActiveNotActiveUserBloc>(context).add(UserActive());
            // if (kIsWeb) {
            //   Future.delayed(
            //       const Duration(seconds: 3),
            //       () => navigatorPushAndRemoveUntil(
            //           context, const MyWebDrawer()));
            // } else {
            Future.delayed(const Duration(seconds: 3),
                () => navigatorPushAndRemoveUntil(context, HomeScreen()));
            // }
          } else if (state is LogInError) {
            if (state.errorModel?.code == 401) {
              Get.snackbar("Invalid Email or Password",
                  "Please check your email or password");
            } else {
              Get.snackbar("Error!", state.errorModel!.message!);
            }
            setState(() {
              isLogInLoading = false;
            });
          }
        },
        child: Scaffold(
          backgroundColor: kWhiteColor,
          body: Form(
            key: _formKey,
            child: SafeArea(
              child:ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>  Column(
                children: [
                  Container(
                    height: 250,
                    width: kMaximumWidgth,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(300),
                            bottomRight: Radius.circular(300)),
                        color: kPrimaryColor),
                    alignment: Alignment.center,
                    child: _appIcon(),
                  ),
                  verticalSpacing20,
                  _content(),
                ],
              ),
            ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appIcon() => MyAppIcon(size: 180);

  Widget _emailTextField() => MyTextField(
        hintText: "Email Address",
        textEditingController: emailController,
        icon: Icons.email_outlined,
        focusNode: emailFocus,
        onFieldSubmitted: (val) =>
            FocusScope.of(context).requestFocus(passwordFocus),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          return null;
        },
      );
  Widget _passwordTextField() => MyTextField(
        hintText: "Password",
        textEditingController: passwordController,
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
        icon: Icons.lock_outlined,
        focusNode: passwordFocus,
        obscureText: isPasswordHidden,
        validator: (val) {
          return null;
        },
        keyboardType: TextInputType.visiblePassword,
      );
  Widget _rememberMeAndForgetPassword() => SizedBox(
        width: getWidth(MediaQuery.of(context).size.width),
        child: Row(
          mainAxisAlignment: mainAxisSpaceBetween,
          children: [
            Row(
              mainAxisAlignment: mainAxisSpaceBetween,
              children: [
                Checkbox(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  value: _checkBoxOnchanged,
                  onChanged: (check) {
                    setState(() {
                      _checkBoxOnchanged = check!;
                    });
                  },
                  // Set fill color based on the state
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (_checkBoxOnchanged) {
                        return kPrimaryColor; // Fill color when checked
                      } else {
                        return Colors.white; // Fill color when unchecked
                      }
                    },
                  ),
                  // Set border color based on the state
                  side: const BorderSide(
                    color: kPrimaryColor, // Border color
                    width: 2.0, // Border width
                  ),
                  checkColor: kWhiteColor, // Check color (when checked)
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _checkBoxOnchanged = !_checkBoxOnchanged;
                    });
                  },
                  child: const Text('Remember me', style: kRememberMeTextStyle),
                ),
              ],
            ),
            Row(
              children: [
                MyTextButton(
                  text: 'Forgot Password ?',
                  color: kPrimaryColor,
                  onPressed: () =>
                      navigatorPush(context, const ForgetPasswordScreen()),
                ),
              ],
            ),
          ],
        ),
      );
  Widget _loginButton() => isLogInLoading
      ? const CircularProgressIndicator(
          color: kPrimaryColor,
        )
      : MyButton(
          bgColor: kPrimaryColor,
          fontColor: kWhiteColor,
          textSize: 20,
          onPressed: () => _submit(),
          buttonText: 'Login');

  Widget _content() => Container(
        width: double.infinity,
        color: kIsWeb ? Colors.transparent : kWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  _emailTextField(),
                  verticalSpacing20,
                  _passwordTextField(),
                  verticalSpacing10,
                  _rememberMeAndForgetPassword(),
                ],
              ),
            ),
            verticalSpacing10,
            _loginButton(),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: MyButtonWithText(
                  buttonTextColor: kPrimaryColor,
                  textColor: kBlackColor,
                  text: 'Don\'t have an account ?',
                  buttonText: 'SignUp',
                  onPressed: () =>
                      navigatorPush(context, const SignUpScreen())),
            ),
          ],
        ),
      );
  void clear() {
    emailController.text = "";
    passwordController.text = "";
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        isLogInLoading = true;
      });
      if (_checkBoxOnchanged) {
        BlocProvider.of<RememberMeBloc>(context).add(RememberMe(
            email: emailController.text, password: passwordController.text));
      }
      logInBloc?.add(ServiceProviderAuth(
          logInModel: LogInModel(
              email: emailController.text, password: passwordController.text)));
      //clear();
    }
  }
}
