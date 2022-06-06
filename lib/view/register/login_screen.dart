import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImg(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(children: [
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
                    // Form()
                  ],
                )),
            const Expanded(
              flex: 6,
              child: LoginWidget(),
            )
          ]),
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTextField(
          prefix: Icon(
            Icons.email,
            color: Theme.of(context).primaryColor,
          ),
          label: 'Email',
          hint: 'abc@gmail.com',
          keyType: TextInputType.emailAddress,
        ),
        kHeight2,
        const DefaultTextField(
          hint: 'password',
          label: 'Password',
          obscureText: true,
          prefix: Icon(Icons.key),
          // suffix: const Icon(Icons.remove_red_eye),
        ),
        kHeight4,
        DefaultButton(
          text: const Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          function: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
        ),
        kHeight1,
        DefaultButton(
          text: RichText(
            text: TextSpan(text: 'Continue with ', children: [
              TextSpan(
                  text: 'Google',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).primaryColor))
            ]),
          ),
          background: Theme.of(context).primaryColorLight,
        ),
        kHeight3,
        RichText(
            text: TextSpan(text: 'Create account? ', children: [
          TextSpan(
              text: 'Sign Up',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).iconTheme.color))
        ]))
      ],
    );
  }
}

class BackgroundImg extends StatelessWidget {
  const BackgroundImg({Key? key, required this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
            backgroundBlendMode: BlendMode.color,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
                fit: BoxFit.cover,
                image: const NetworkImage(urlImg))),
        child: widget);
  }
}

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            // height: dHeight(context) / 8,
            // width: dWidth(context) / 1.2,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
              right: dWidth(context) / 30,
            ),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(kRadius)),
            child: TextFormField(
              decoration:  InputDecoration(
                  labelText: 'Email',
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(width: 2,color: Theme.of(context).primaryColorLight))),
            ),
          ),
        ),
      ),
    );
  }
}