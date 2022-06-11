// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Notifications',
          style: GoogleFonts.oswald(),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              child: Row(children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(profImg),
                  radius: 28,
                ),
                kWidth1,
                RichText(
                  text: TextSpan(
                      text: 'Username',
                      style: GoogleFonts.dmSans()
                          .copyWith(color: kBlack, fontWeight: FontWeight.bold),
                      children: const [
                        TextSpan(text: '  '),
                        TextSpan(
                            text: 'notification',
                            style: TextStyle(fontWeight: FontWeight.normal)),
                      ]),
                ),
                const Spacer(),
                const Text(
                  'time',
                  style: TextStyle(color: Colors.black54),
                )
              ]),
            );
          }),
    );
  }
}
