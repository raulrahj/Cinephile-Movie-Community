import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_box/view/constants.dart';
import 'package:open_box/view/core.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    child: Column(children: [
                      Row(
                        children:  [
                        const  CircleAvatar(
                            backgroundImage: NetworkImage(urlImg),
                            radius: 15,
                          ),
                          kWidth2,
                          Text('Username',style: GoogleFonts.oswald(),)
                        ],
                      ),
                   Row(
                     children: const[
                       kWidth4,
                       Expanded(
                         child: Text('hei',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis
                          ),),
                       ),
                     ],
                   )
                    ]),
                  ),
                );
              })),
    );
  }
}
