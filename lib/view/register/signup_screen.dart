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
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BackgroundImg(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2 / 1.5,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DefaultTextField(
                        label: 'Name',
                        prefix: const Icon(Icons.person_pin),
                        controller: _nameController,
                      ),
                      kHeight1,
                      DefaultTextField(
                        label: 'Email',
                        prefix: const Icon(Icons.email),
                        controller: _emailController,
                      ),
                      kHeight1,
                      DefaultTextField(
                        label: 'Password',
                        obscureText: true,
                        prefix: const Icon(Icons.key),
                        controller: _passwordController,
                      ),
                      kHeight1,
                      // const DefaultTextField(
                      //   label: 'Re-enter Password',
                      //   obscureText: true,
                      //   prefix: Icon(Icons.key),
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
                          final data = UserData(
                              userName: _nameController.text,
                              password: _passwordController.text,
                              firstName: _emailController.text);
                          Register().signUp(signUpData: data);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const VerifyScreen()));
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
                        function: () {},
                      ),
                    ],
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
