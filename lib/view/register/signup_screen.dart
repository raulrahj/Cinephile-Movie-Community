import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/register/register_user.dart';
import 'package:open_box/view/register/login_screen.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/widgets/or_divider.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';
import 'package:open_box/view/widgets/l_headline.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _lastnameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmpasswordController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? userName;
  String? firstName;
  String? lastName;
  String? password;
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _lastnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImg(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Icon(Icons.theaters),
                    kHeight1,
                    const LargeHeadlineWidget(
                      title: 'Welcome',
                    ),
                    kHeight1,
                    kHeight2,
                    HeadlineWidget(
                      title: 'Sign up with Cinephile',
                      color: Theme.of(context).primaryColorLight,
                    ),
                    kHeight1
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DefaultTextField(
                          label: 'First Name',
                          prefix: const Icon(Icons.person_pin),
                          controller: _nameController,
                          validator: (value) =>
                              value!.isEmpty ? "* Required" : null,
                          onSaved: (onSave) => {firstName = onSave},
                        ),
                        kHeight1,
                        DefaultTextField(
                          label: 'Last Name',
                          prefix: const Icon(Icons.person_pin),
                          controller: _nameController,
                          validator: (value) =>
                              value!.isEmpty ? "* Required" : null,
                          onSaved: (onSave) => {lastName = onSave},
                        ),
                        kHeight1,
                        DefaultTextField(
                          label: 'E-mail',
                          prefix: const Icon(Icons.email),
                          controller: _emailController,
                          validator: (value) =>
                              value!.isEmpty ? "* Required" : null,
                          onSaved: (onsave) => {userName = onsave},
                        ),
                        kHeight1,
                        DefaultTextField(
                          label: 'Password',
                          obscureText: true,
                          prefix: const Icon(Icons.key),
                          controller: _passwordController,
                          validator: (value) =>
                              value!.isEmpty ? "* Required" : null,
                          onSaved: (onsave) => {password = onsave},
                        ),
                        kHeight1,
                        // DefaultTextField(
                        //   label: 'Re-enter Password',
                        //   obscureText: true,
                        //   prefix: const Icon(Icons.key),
                        //   controller: _confirmpasswordController,
                        //   validator: (value) {
                        //     if (value != _passwordController.text) {
                        //       return "Password not matching";
                        //     }else if(value == _passwordController.text){
                        //       return null;
                        //     }
                        //      else if (value!.isEmpty) {
                        //       return "* Required";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        // ),
                        kHeight3,
                        DefaultButton(
                          text: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          function: () async {
                            final reg = Register();
                            final form = formKey.currentState;
                            if (form!.validate()) {
                              form.save();
                              final data = UserResp(
                                  firstname: firstName!,
                                  password: password,
                                  username: userName!,
                                  lastname: lastName!);
                              final user = await reg
                                  .signUp(signUpData: data)
                                  .whenComplete(() {
                                log('New user Registered');
                              }).then((response) {
                                if (response != null) {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Signup Success !!!',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                        context,
                                                        '/login',
                                                        (route) => false);
                                              },
                                              child: const Text('OK'),
                                            )
                                          ],
                                        );
                                      });
                                }
                              });
                            } else {}

                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => const VerifyScreen()));
                          },
                        ),
                        const OrDivider(),
                        DefaultButton(
                          text: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Continue with",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              kWidth1,
                              const FaIcon(
                                FontAwesomeIcons.google,
                                color: kRed,
                              )
                            ],
                          ),
                          background: Theme.of(context).primaryColorLight,
                          function: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
