import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/user/user.dart';
import 'package:open_box/view/widgets/common.dart';

class SPreferences extends StatelessWidget {
  const SPreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        leading: pop(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            title: const Text('Delete Account'),
            leading: const Icon(Icons.delete),
            onTap: () async {
              final userData = await SharedService.getUserProfile();

              // final data = jsonEncode(userData);
              // final usr = userDataFromJson(data);
              if (userData != null) {
                final userRepo = UserRepo();
                final deleteResponse = await userRepo
                    .deleteUser(id: userData.user!.id!, context: context)
                    .then((response) {
                  if (response != null) {
                    SharedService.logout(context);
                  }
                });
              } else {
                log('Can\'t get the user');
              }
            },
          )
        ],
      )),
    );
  }
}
