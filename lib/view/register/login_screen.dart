import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/data/models/user/m_login.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/register/register_user.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';
import 'package:open_box/view/widgets/l_headline.dart';

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
                    // Form()
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
              prefix: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,
              ),
              label: 'E-mail',
              hint: 'abc@gmail.com',
              keyType: TextInputType.emailAddress,
              validator: (value) => value!.isEmpty ? "* Required" : null,
              onSaved: (onSaved) => {userName = onSaved},
            ),
            kHeight2,
            DefaultTextField(
              // controller: controller2,
              hint: 'password',
              label: 'Password',
              obscureText: true,

              prefix: Icon(
                Icons.key,
                color: Theme.of(context).primaryColor,
              ),
              validator: (value) => value!.isEmpty ? "* Required" : null,
              onSaved: (onsaved) => {password = onsaved},

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
              function: () async {
                final form = formKey.currentState;
                if (form!.validate()) {
                  form.save();
                  final data =
                      LoginModel(username: userName!, password: password!);
                  // await Future.delayed(const Duration(seconds: 10));
                  Register reg = Register();

                  // final data = LoginModel(username: 'raul', password: '123456');
                  final user = await reg
                      .loginUser(loginData: data)
                      .whenComplete(() async {
                    final isLogged =
                        await SharedService.isLoggedIn().then((isOk) async {
                      Future.delayed(Duration(seconds: 3));
                      // final isOk = await SharedService.isLoggedIn();
                      print('Checking Login status');
                      if (isOk) {
                        // ignore: use_build_context_synchronously
                        await Navigator.pushNamedAndRemoveUntil(
                            context, '/main', (route) => false);
                      }
                    });
                  });
                } else {}
              },
            ),
            kHeight1,
            DefaultButton(
              text: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue with",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  kWidth1,
                  const FaIcon(
                    FontAwesomeIcons.google,
                    color: kRed,
                  )
                ],
              ),
              background: Theme.of(context).primaryColorLight,
              function: ()async{

              },
            ),
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
            image: const NetworkImage(urlImg),
          ),
        ),
        child: widget);
  }
// }

// class Form extends StatelessWidget {
//   const Form({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(kRadius),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
//           child: Container(
//             // height: dHeight(context) / 8,
//             // width: dWidth(context) / 1.2,
//             alignment: Alignment.center,
//             padding: EdgeInsets.only(
//               right: dWidth(context) / 30,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.05),
//               borderRadius: BorderRadius.circular(kRadius),
//             ),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(
//                       width: 2, color: Theme.of(context).primaryColorLight),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
}
