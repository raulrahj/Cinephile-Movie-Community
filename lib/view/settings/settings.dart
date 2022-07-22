import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/logic/bloc/user/user_bloc.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/settings/preferences.dart';
import 'package:open_box/view/settings/widgets/profile_display.dart';
import 'package:open_box/view/settings/widgets/s_container.dart';
import 'package:open_box/view/settings/widgets/s_tile.dart';
import 'package:open_box/view/settings/widgets/s_title.dart';

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
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is CurrentUserState) {
                        return ProfiileDisplay(
                          image:
                              "$kApiImgUrl/${state.profileData!.user!.profilePicture!}",
                          name: state.profileData!.user!.firstname,
                        );
                      } else {
                        return const ProfiileDisplay();
                      }
                    },
                  ),
                )
              ]),
            ),
            kHeight1,
            SettingsContainer(
              children: [
                const SettingsTitleWidget(
                  title: 'Profile',
                ),
                SettingsTileWidget(
                  icon: Icons.account_circle,
                  title: 'Account',
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
                  icon: Icons.build_rounded,
                  title: 'Preferences',
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const SPreferences()));
                  },
                ),
                SettingsTileWidget(
                  icon: Icons.privacy_tip_rounded,
                  title: 'Privacy Policy',
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const SPreferences()));
                  },
                ),
                SettingsTileWidget(
                  icon: Icons.notifications_active,
                  title: 'Notification',
                  function: () {},
                ),
              ],
            ),

            SettingsContainer(children: [
              const SettingsTitleWidget(
                title: 'General',
              ),
              SettingsTileWidget(
                icon: Icons.settings_accessibility_rounded,
                title: 'Accesibility',
                function: () {},
              ),
              SettingsTileWidget(
                icon: Icons.info,
                title: 'About',
                function: () {},
              ),
              SettingsTileWidget(
                icon: Icons.coffee_outlined,
                title: 'Developer',
                function: () {},
              ),
            ]),

            // SettingsTileWidget(),

            // ),/
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SettingsTileWidget(
                icon: Icons.launch_outlined,
                title: 'Log Out',
                function: () async {
                  await SharedService.logout(context).whenComplete(() {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                    log('User Logged Out !!!');
                  });
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
