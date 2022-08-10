import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_box/config/constants.dart';

Future<dynamic> shareBSheet(BuildContext context, String postText) {
  return showModalBottomSheet(
    // backgroundColor: Theme.of(context).primaryColorLight,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: dHeight(context) / 3.8,
        child: Column(
          children: [
            const Divider(
              thickness: 7,
              indent: 150,
              endIndent: 150,
            ),
            kHeight1,
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('copy to Clipboard'),
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: postText));
              },
            ),
            // div,
            ListTile(
              leading: const Icon(Icons.whatsapp),
              title: const Text('share to Whatsapp'),
              onTap: () {},
            )
          ],
        ),
      );
    },
  );
}
