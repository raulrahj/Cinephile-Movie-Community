import 'package:flutter/material.dart';
import 'package:open_box/config/constants.dart';
import 'package:open_box/config/core.dart';
import 'package:open_box/config/strings.dart';
import 'package:open_box/data/models/post/m_post.dart';
import 'package:open_box/data/models/user/m_profile.dart';
import 'package:open_box/data/models/user/m_user.dart';
import 'package:open_box/data/util/date_parse.dart';
import 'package:open_box/view/profile_screen/post_view.dart';
import 'package:open_box/view/widgets/placeholders.dart';


class PostList extends StatelessWidget {
  const PostList(
      {Key? key,
      required this.isProfile,
      required this.postData,
      this.profileData,
      this.userData})
      : super(key: key);
  final List<Post> postData;
  final UserModel? userData;
  final ProfileModel? profileData;
  final bool isProfile;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
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
                          userData: userData,
                          data: data,
                          isProfile: isProfile,
                          profileData: profileData,
                        )));
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
                  child: data.image != null
                      ? Image.network(
                          "${data.image}",
                          fit: BoxFit.cover,
                          frameBuilder:
                              (context, child, frame, wasSynchronouslyLoaded) {
                            return child;
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(child: PTile());
                            }
                          },
                          errorBuilder: (BuildContext context, _, __) {
                            return Image.asset(
                              errorImgPlaceHolder,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(errorImgPlaceHolder),
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
                        ParseDate.dFormatDate(data.createdAt),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
