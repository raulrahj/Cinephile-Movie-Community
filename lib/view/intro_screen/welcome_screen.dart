import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      isTopSafeArea: true, // Safe Area to avoid overlaps with the status bar
      showDoneButton: true,

      done: const Text('Done', style: TextStyle(color: kSecondary)),
      dotsDecorator: DotsDecorator(
        activeSize: const Size(15, 9),
        activeColor: kSecondary,
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),

      onDone: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isDone', true);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/sign_up');
      },
      next: const Text('Next', style: TextStyle(color: kSecondary)),

      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(color: kSecondary)),
      showNextButton: true,

      onSkip: () => Navigator.of(context).pushReplacementNamed('/sign_up'),

      pages: [
        PageViewModel(
          decoration: PageDecoration(
              titleTextStyle: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
              bodyTextStyle: GoogleFonts.montserrat()),
          image: Image.asset(
            "assets/images/logo.jpg",
            fit: BoxFit.contain,
            height: 200,
          ),
          title: p1Title,
          body: p1Body,
        ),
        PageViewModel(
          decoration: PageDecoration(
              titleTextStyle: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
              bodyTextStyle: GoogleFonts.montserrat()),
          image: Lottie.asset(oBImg1,
              height: dHeight(context) / 2.5, repeat: false),
          title: p2Title,
          body: p2Body,
        ),
        PageViewModel(
          decoration: PageDecoration(
              titleTextStyle: GoogleFonts.ubuntu()
                  .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
              bodyTextStyle: GoogleFonts.montserrat()),
          image: Lottie.asset(oBImg2,
              height: dHeight(context) / 2.5,
              repeat: false,
              fit: BoxFit.contain),
          body: p3Body,
          title: p3Title,
        ),
      ],
    );
  }
}
