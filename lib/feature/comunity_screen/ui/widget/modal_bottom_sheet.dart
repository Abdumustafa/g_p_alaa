import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/comment_post_app.dart';

void ModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: FractionallySizedBox(
          heightFactor: 1,
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(50),
                Container(
                  width: 180,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                verticalSpace(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Likes",
                          style: TextStyles.font18BlackboldMerriweather),
                      verticalSpace(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person5.png")),
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person6.png")),
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person7.png")),
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person8.png")),
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/person9.png")),
                          Stack(
                            children: [
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xffe6e7e9)),
                              Positioned(
                                top: 9,
                                bottom: 9,
                                left: 5,
                                right: 5,
                                child: Text("+120",
                                    style: TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Comments",
                                  style:
                                      TextStyles.font18BlackboldMerriweather),
                              Text("Most Recent",
                                  style: TextStyle(
                                      color: Colors.blueGrey, fontSize: 12)),
                            ],
                          ),
                          verticalSpace(10),
                          CommentPostApp(
                            profileImage: "assets/images/person9.png",
                            profileName: 'sara abdelrasoul',
                            commentDate: '01:32 am',
                            commentText:
                                'Dealing with kidney problems was hard, but this app makes it easier to understand and track my health.',
                            commentImage: "assets/images/post.png",
                          ),
                          verticalSpace(20),
                          CommentPostApp(
                            profileImage: "assets/images/person9.png",
                            profileName: 'sara abdelrasoul',
                            commentDate: '01:32 am',
                            commentText:
                                'Dealing with kidney problems was hard, but this app makes it easier to understand and track my health.',
                          ),
                          verticalSpace(10),
                          CommentPostApp(
                            profileImage: "assets/images/person9.png",
                            profileName: 'sara abdelrasoul',
                            commentDate: '01:32 am',
                            commentText:
                                'Dealing with kidney problems was hard, but this app makes it easier to understand and track my health.',
                            commentImage: "assets/images/post.png",
                          ),
                          verticalSpace(20),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/camera.svg', height: 24),
                      horizontalSpace(10),
                      SvgPicture.asset('assets/images/face-smile.svg',
                          height: 24),
                      horizontalSpace(10),
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 40,
                            maxHeight: 150,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              border: InputBorder.none,
                              hintText: "comment...",
                              hintStyle: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      SvgPicture.asset('assets/images/telegram-logo-light.svg',
                          height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
