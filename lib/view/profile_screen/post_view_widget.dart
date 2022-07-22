import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/view/profile_screen/post_view.dart';

import '../intro_screen/splash_screen.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key, required this.postData}) : super(key: key);
  final List<Post> postData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      // crossAxisCount: 2,
      // ),

      itemCount: postData.length,
      itemBuilder: (BuildContext context, int index) {
        final Post data = postData[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostView(
                          data: data,
                        )));
            print(data.id.toString());
          },
          child: Container(
            height: dHeight(context) * .10,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

            // height: 100,
            width: dWidth(context),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Image(
                    image: data.image != null
                        ? NetworkImage("$kApiImgUrl/${data.image}")
                        : const NetworkImage(logo),
                    fit: BoxFit.cover,
                  ),
                ),
                kWidth1,
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          data.desc ?? lorem,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          dateFormat(data.createdAt),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.grey),
                        )
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
