import 'package:flutter/material.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/home/home_screen.dart';
import 'package:open_box/view/register/login_screen.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/widgets/bottom_nav.dart';
import 'package:open_box/view/widgets/default_button.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImg(
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AspectRatio(
            aspectRatio: 4 / 6,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: dWidth(context) / 3,
                  child: const LogoWidget(),
                ),
                kHeight4,
                const LargeHeadlineWidget(title: 'Email verification'),
                HeadlineWidget(
                  title: 'Enter verification code',
                  color: Theme.of(context).primaryColorLight,
                ),
                kHeight4,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      OtpBox(),
                      OtpBox(),
                      OtpBox(),
                      OtpBox(),
                    ],
                  ),
                ),
                kHeight4,
                // kHeight4,
                DefaultButton(
                  text: const Text('Verify'),
                  function: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavController()));
                  },
                  background: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.theaters,
          size: 50,
        ),
        kHeight1,
        Text(
          'Cinephile',
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Theme.of(context).primaryColorLight,
              fontFamily: fH1.fontFamily),
        )
      ],
    );
  }
}

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);
  final String title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
                color: Theme.of(context).iconTheme.color,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
          ),
          kWidth1,
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: color ?? Colors.black12),
          ),
        ],
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Text(
        '______',
        style: TextStyle(color: Theme.of(context).primaryColorLight),
      ),
    );
  }
}
