import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/register/register_user.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/settings/preferences.dart';
import 'package:open_box/view/settings/widgets/s_exp_tile.dart';
import 'package:open_box/view/settings/widgets/s_tile.dart';
import 'package:open_box/view/settings/widgets/s_title.dart';
import 'package:open_box/view/widgets/l_headline.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const LargeHeadlineWidget(title: 'Settings'),
            const SettingsTitleWidget(
              title: 'Account',
            ),
            ExpWidget(
              title: 'Login and Security',
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                  function: () async {
                    final userData = await Register().getUserProfile();
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, '/account',
                        arguments: ProfileArg(user: userData));
                  },
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const SPreferences()));
                  },
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Log Out',
                  function: () async {
                    await SharedService.logout(context).whenComplete(() {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (route) => false);
                      log('User Logged Out !!!');
                    });
                  },
                ),
                // SettingsTileWidget(),
              ],
            ),
            const ExpWidget(
              title: 'Privacy Policy',
              children: [
                // SettingsTileWidget(
                //   icon: Icons.account_circle,
                //   title: 'Profile',
                // ),
                // SettingsTileWidget(
                //   icon: Icons.settings_outlined,
                //   title: 'Preferences',
                // ),
                // // SettingsTileWidget(),
              ],
            ),
            const ExpWidget(
              title: 'Notification',
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                ),
                // SettingsTileWidget(),
              ],
            ),
            const ExpWidget(
              title: 'Content Preferences',
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                ),
                // SettingsTileWidget(),
              ],
            ),
            const SettingsTitleWidget(
              title: 'General',
            ),
            const ExpWidget(
              title: 'Display and Sound',
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                ),
                // SettingsTileWidget(),
              ],
            ),
            const ExpWidget(
              title: ('Accesibility'),
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                ),
                // SettingsTileWidget(),
              ],
            ),
            const ExpWidget(
              title: 'About',
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                ),
                // SettingsTileWidget(),
              ],
            ),
            const ExpWidget(
              title: 'Developer',
              children: [
                const SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
                ),
                // SettingsTileWidget(),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
