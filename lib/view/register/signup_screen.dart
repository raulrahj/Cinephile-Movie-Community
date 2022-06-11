import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/register/login_screen.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/widgets/or_divider.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';

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
                     HeadlineWidget(title: 'Sign up with Cinephile',color: Theme.of(context).primaryColorLight,),
                    kHeight1
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 3 / 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const DefaultTextField(
                        label: 'Name',
                        prefix: Icon(Icons.person_pin),
                      ),
                      kHeight1,
                      const DefaultTextField(
                        label: 'Email',
                        prefix: Icon(Icons.email),
                      ),
                      kHeight1,
                      const DefaultTextField(
                        label: 'Password',
                        obscureText: true,
                        prefix: Icon(Icons.key),
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
                        function: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const VerifyScreen()));
                        },
                      ),
                      const OrDivider(),
                      DefaultButton(
                        text: RichText(
                          text: TextSpan(text: 'Continue with ', children: [
                            TextSpan(
                                text: 'Google',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor))
                          ]),
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

class LargeHeadlineWidget extends StatelessWidget {
  const LargeHeadlineWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth2,
        Text(
          title,
          style: GoogleFonts.oswald().copyWith(
              color: Theme.of(context).primaryColorLight, fontSize: 28),
        ),
      ],
    );
  }
}
