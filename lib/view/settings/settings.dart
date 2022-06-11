import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/signup_screen.dart';
import 'package:open_box/view/settings/widgets/s_exp_tile.dart';
import 'package:open_box/view/settings/widgets/s_tile.dart';
import 'package:open_box/view/settings/widgets/s_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children:  [
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
                  function: ()=> Navigator.pushNamed(context, '/account'),
                ),
                const SettingsTileWidget(
                  icon: Icons.settings_outlined,
                  title: 'Preferences',
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
