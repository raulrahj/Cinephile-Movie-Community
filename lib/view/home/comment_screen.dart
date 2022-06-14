import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Comments'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(profImg),
                          radius: 15,
                        ),
                        kWidth2,
                        Text(
                          'Username',
                          style: GoogleFonts.oswald(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        kWidth4,
                        kWidth1,
                        // LayoutBuilder(builder: (context, constraints) {
                        //   return
                        Expanded(
                          child: Text(
                            lorem,
                            maxLines: 5,
                            style: GoogleFonts.dmSans()
                                .copyWith(overflow: TextOverflow.ellipsis),
                          ),
                        )
                        // }),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
