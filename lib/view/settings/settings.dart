import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/infrastructure/auth/authenticaton.dart';

import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
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
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Stack(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    height: dHeight(context) * .13,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      Container(color: kWhite, height: dHeight(context) * .13),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(profImg),
                        radius: 54,
                      ),
                      Text(
                        "User name",
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                )
              ]),
            ),
            // const LargeHeadlineWidget(title: ),
            const SettingsTitleWidget(
              title: 'Profile',
            ),
        //     Card(
        //   elevation: 5,
        //   child: ListTile(
        //     leading: Icon(Icons.person),
        //     title: Text('Account'),
        //     // subtitle: Text('Icream is good for health'),
        //     trailing: Icon(Icons.arrow_forward),
        //   ),
        // ),
            ExpWidget(
              title: 'Account Details',
              children: [
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Profile',
                  function: () async {
                    // final cUser = await Authentication().getUserProfile();
                    // ignore: use_build_context_synchronously
                    context.read<UserBloc>().add(LoadCurrentUser());
                    // final userData =
                    //     await UserRepo().getUser(id: cUser!.user!.id!);
                    // await Register().getUserProfile();

                    // ignore: use_build_context_synchronously
                    await Navigator.pushNamed(context, '/account',
                        arguments: ProfileArg(isProfile: true));
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
