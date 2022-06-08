import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/register/otp_verification.dart';
import 'package:open_box/view/register/signup_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            LargeHeadlineWidget(title: 'Settings'),
            SettingsTitleWidget(
              title: 'Account',
            ),
            ExpWidget(
              title: 'Login and Security',
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
            ExpWidget(
              title: 'Privacy Policy',
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
            ExpWidget(
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
            ExpWidget(
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
            SettingsTitleWidget(
              title: 'General',
            ),
            ExpWidget(
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
            ExpWidget(
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
            ExpWidget(
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
            ExpWidget(
              title: 'Developer',
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
          ],
        ),
      )),
    );
  }
}

class ExpWidget extends StatelessWidget {
  const ExpWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  // final Function function
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedTextColor: Theme.of(context).primaryColor,
      title: Text(title),
      children: children,
    );
  }
}

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
      color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            children: [
              Icon(icon,color: kBlack,),
              kWidth1,
              Text(
                title,
                style: GoogleFonts.dmSans()
                    .copyWith(fontSize: 18, color: kBlack),
              )
            ],
          ),
        ),
      ),
        onTap: (){},
    );
  }
}

class SettingsTitleWidget extends StatelessWidget {
  const SettingsTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: dHeight(context) / 23,
      color: Theme.of(context).primaryColorLight,
      child: HeadlineWidget(
        title: title,
        color: kBlack,
      ),
    );
  }
}
