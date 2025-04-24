import 'package:flutter/material.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/post_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/user_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/post_community_app.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios_sharp, size: 18)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: Image.asset(
                        'assets/images/back_profile.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -140,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/person3.png'),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt, size: 15),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(10),
                        Text(
                          'Mostafa walied',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpace(10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.edit, color: Colors.blueGrey),
                              SizedBox(width: 5),
                              Text(
                                'Add Post',
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostCommunityApp(
                      profileImage: post.user.profileImage.url,
                      profileName: post.user.userName,
                      postDate: '${post.createdAt.day}/${post.createdAt.month}',
                      tag: post.tag,
                      tagColor: Colors.red,
                      postText: post.content,
                      postImage:
                          post.media.isNotEmpty ? post.media[0].url : null,
                    );
                  }),
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
                      postDate: '${post.createdAt.day}/${post.createdAt.month}',
                      tag: post.tag,
                      tagColor: Colors.red,
                      postText: post.content,
                      postImage:
                          post.media.isNotEmpty ? post.media[0].url : null,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
