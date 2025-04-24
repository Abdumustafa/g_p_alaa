import 'package:flutter/material.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/services/get_all_posts.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/post_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/user_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/screen/opacity_welcom_screen.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/app_bottom_nav_bar.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/notifications_icon.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/post_community_app.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/profile_add_post.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool showOverlay = true;

  void hideOverlay() {
    setState(() {
      showOverlay = false;
    });
  }

  List<PostModel> posts = [
    PostModel(
      id: '2',
      user: User(
        id: 'u2',
        userName: 'Sara Kamal',
        profileImage: ProfileImage(
          url: 'assets/images/person2.png',
          id: 'p1',
        ),
      ),
      content: 'Health is wealth 💪 Stay hydrated and exercise!',
      media: [],
      tag: 'Advice',
      createdAt: DateTime.parse("2025-03-10T14:20:00.000Z"),
      updatedAt: DateTime.parse("2025-03-10T14:20:00.000Z"),
      commentCount: 0,
      likes: [],
      likesCount: 0,
      comments: [],
      isLiked: false,
    ),
    PostModel(
      id: '2',
      user: User(
        id: 'u2',
        userName: 'Sara Kamal',
        profileImage: ProfileImage(
          url: 'assets/images/person2.png',
          id: 'p1',
        ),
      ),
      content: 'Health is wealth 💪 Stay hydrated and exercise!',
      media: [],
      tag: 'Advice',
      createdAt: DateTime.parse("2025-03-10T14:20:00.000Z"),
      updatedAt: DateTime.parse("2025-03-10T14:20:00.000Z"),
      commentCount: 0,
      likes: [],
      likesCount: 0,
      comments: [],
      isLiked: false,
    ),
    PostModel(
      id: '2',
      user: User(
        id: 'u2',
        userName: 'Sara Kamal',
        profileImage: ProfileImage(
          url: 'assets/images/person2.png',
          id: 'p1',
        ),
      ),
      content: 'Health is wealth 💪 Stay hydrated and exercise!',
      media: [],
      tag: 'Advice',
      createdAt: DateTime.parse("2025-03-10T14:20:00.000Z"),
      updatedAt: DateTime.parse("2025-03-10T14:20:00.000Z"),
      commentCount: 0,
      likes: [],
      likesCount: 0,
      comments: [],
      isLiked: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            leading: Icon(Icons.arrow_back_ios_sharp, size: 18),
            backgroundColor: Colors.white,
            title: Text(
              "community",
              style: TextStyles.font20BlackBoldMerriweather,
            ),
            centerTitle: true,
            actions: [NotificationsIconAppBare()],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProfileAndAddPost(),
                verticalSpace(30),
                FutureBuilder<List<PostModel>>(
                    future: AllPostsServices().getAllPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: posts.length,
                          itemBuilder: (context, index) {
                            final post = posts[index];
                            return PostCommunityApp(
                              profileImage: post.user.profileImage.url,
                              profileName: post.user.userName,
                              postDate:
                                  '${post.createdAt.day}/${post.createdAt.month}',
                              yourMain: post.tag,
                              yourMainColor: Colors.red,
                              postText: post.content,
                              postImage: post.media.isNotEmpty
                                  ? post.media[0].url
                                  : null,
                            );
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
                verticalSpace(30),
              ],
            ),
          ),
          bottomNavigationBar: AppBottomNavigationBar(),
        ),
        if (showOverlay)
          OpacityWelcomScreen(
            onClose: hideOverlay,
          ),
      ],
    );
  }
}
