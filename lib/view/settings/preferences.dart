import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/infrastructure/helper/shared_service.dart';
import 'package:open_box/infrastructure/user/user.dart';

class SPreferences extends StatelessWidget {
  const SPreferences({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                final userFunc = UserFunc();
                final deleteResponse = await userFunc
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
