import 'package:flutter/material.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/services/get_all_posts.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/post_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/screen/opacity_welcom_screen.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/app_bottom_nav_bar.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/notifications_icon.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/post_community_app.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/profile_add_post.dart';
import 'package:get/get.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  bool showOverlay = true;
  late Future<List<PostModel>> futurePosts;

  void hideOverlay() {
    setState(() {
      showOverlay = false;
      futurePosts = AllPostsServices().getAllPosts();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            leading: Icon(Icons.arrow_back_ios_sharp, size: 18),
            backgroundColor: Colors.white,
            title: Text("community",
                style: TextStyles.font20BlackBoldMerriweather),
            centerTitle: true,
            actions: [NotificationsIconAppBare()],
          ),
          body: showOverlay
              ? SizedBox.shrink()
              : FutureBuilder<List<PostModel>>(
                  future: futurePosts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      final height = MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          MediaQuery.of(context).padding.top;
                      return Container(
                        height: height,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      Future.microtask(() {
                        Get.toNamed("/NoNetworkScreen");
                      });
                      return SizedBox.shrink();
                    }

                    final posts = snapshot.data;
                    if (posts == null || posts.isEmpty) {
                      return Center(child: Text('No posts available.'));
                    }

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                "/CreatePostScreen",
                                arguments: {
                                  "profileImage": posts.first.user.profileImage.url,
                                },
                              );
                            },
                            child: ProfileAndAddPost(
                              image: posts.first.user.profileImage.url,
                            ),
                          ),
                          verticalSpace(30),
                          ListView.builder(
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
                                tag: post.tag,
                                tagColor: Color(0xFFd5dbf5),
                                postText: post.content,
                                postImage: post.media.isNotEmpty
                                    ? post.media[0].url
                                    : null,
                                likesCount: post.likesCount,
                                commentCount: post.commentCount,
                              );
                            },
                          ),
                          verticalSpace(30),
                        ],
                      ),
                    );
                  },
                ),
          bottomNavigationBar: AppBottomNavigationBar(),
        ),
        if (showOverlay) OpacityWelcomScreen(onClose: hideOverlay),
      ],
    );
  }
}
