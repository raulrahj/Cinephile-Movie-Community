import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/profile_screen/profile_screen.dart';
import 'package:open_box/view/widgets/default_button.dart';
import 'package:open_box/view/widgets/default_textfield.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          kHeight4,
          AspectRatio(
            aspectRatio: 1 / 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    kWidth1,
                    const CircleAvatar(
                      radius: 54,
                    ),
                    kWidth2,
                    ActionChip(
                        label: Row(children: const [
                          Icon(Icons.edit),
                          Text('Change photo')
                        ]),
                        onPressed: () {})
                  ],
                ),
                kHeight2,
                // Text('Username'),
                // Text('abc@gmail.com'),
                kHeight1,
                const DefaultTextField(
                  label: 'Name',
                ),
                kHeight1,
                const DefaultTextField(
                  label: 'Last Name',
                ),
                kHeight2,
                const DefaultButton(
                    text: Text(
                  'Update',
                  style: TextStyle(color: kWhite),
                ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
