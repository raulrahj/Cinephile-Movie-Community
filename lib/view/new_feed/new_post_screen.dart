import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';
import 'package:open_box/view/widgets/common.dart';

class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Share your thoughts',
          style: GoogleFonts.dmSans(),
        ),
        leading: close(context)
        ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(children: [
          AspectRatio(
            aspectRatio: 3 / 1,
            child: Row(
              children: const [
                CircleAvatar(
                backgroundImage: NetworkImage(profImg),),
                kWidth1,
                Text('Username'),
              ],
            ),
          ),
          Expanded(
              child: TextFormField(
            decoration: const InputDecoration.collapsed(
              hintText: 'what is on your mind?',
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
              TextButton(onPressed: () {}, child: const Text('Share'))
            ],
          )
        ]),
      ),
    );
  }
}
