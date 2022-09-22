import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/data/util/form_validation.dart';
import 'package:open_box/logic/cubit/auth/authentication_cubit.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/widgets/bg.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';
import 'package:open_box/view/widgets/l_headline.dart';
import 'package:open_box/view/widgets/progress_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userName;
  String? password;
  @override
  void dispose() {
    super.dispose();
    //   userNameController.dispose();
    //   passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImg(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      kHeight4,
                      const LargeHeadlineWidget(title: "Welcome Back"),
                      HeadlineWidget(
                        title: 'Continue to your account',
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: LoginWidget(
                    controller1: userNameController,
                    controller2: passwordController,
                    // formKey: formKey,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
    required this.controller1,
    required this.controller2,

    // this.formKey,
  }) : super(key: key);
  // final GlobalKey<FormState>? formKey;
  final TextEditingController controller1;
  final TextEditingController controller2;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTextField(
              // controller: controller1,
              prefix: Icons.email,
              label: 'E-mail',
              hint: 'abc@gmail.com',
              keyType: TextInputType.emailAddress,
              validator: FormValidation().emailValidation,
              onSaved: (onSaved) => {userName = onSaved},
            ),
            kHeight2,
            DefaultTextField(
              // controller: controller2,
              hint: 'password',
              label: 'Password',
              obscureText: true,
              prefix: Icons.key,
              validator: FormValidation().passwordValidation,
              onSaved: (onsaved) => {password = onsaved},
              // suffix: const Icon(Icons.remove_red_eye),
            ),
            kHeight4,
            BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
                return DefaultButton(
                  text: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  function: () async {
                    final form = formKey.currentState;
                    if (form!.validate()) {
                      form.save();
                      FocusScope.of(context).unfocus();

                      final data =
                          LoginModel(username: userName!, password: password!);
                      await context
                          .read<AuthenticationCubit>()
                          .login(loginData: data);
                      if (state.isLoading) {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return const SimpleDialog(
                                backgroundColor: Colors.transparent,
                                children: [Center(child: ProgressCircle())],
                              );
                            });
                      } else if (!state.isError && !state.isLoading) {
                        print('wrong');
                        // ignore: use_build_context_synchronously
                        // await
                      } else if (state.isError) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorText)));
                      }
                    } else {}
                  },
                );
              },
            ),
            BlocListener<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {
                if (state.isLoginSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false);
                }
              },
              child: none,
            ),
            kHeight1,
            // DefaultButton(
            //   text: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Continue with",
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodyLarge!
            //             .copyWith(color: Theme.of(context).primaryColor),
            //       ),
            //       kWidth1,
            //       const FaIcon(
            //         FontAwesomeIcons.google,
            //         color: kRed,
            //       )
            //     ],
            //   ),
            //   background: Theme.of(context).primaryColorLight,
            //   function: () async {},
            // ),
            kHeight3,
            RichText(
              text: TextSpan(
                text: 'Create account? ',
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).iconTheme.color),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(context, '/sign_up'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
