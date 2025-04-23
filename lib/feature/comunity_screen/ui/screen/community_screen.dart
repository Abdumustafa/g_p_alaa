import 'package:flutter/material.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
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
                PostCommunityApp(
                  profileImage: 'assets/images/person2.png',
                  profileName: 'Rosy Rose',
                  postDate: '2 Feb at 4:56',
                  yourMain: 'Question',
                  yourMainColor: Color(0xffd5dbf5),
                  postText:
                      'Overcoming kidney disease was tough, but I’m grateful for the journey. Wishing healing for all. ❤️ #SupportPost',
                ),
                verticalSpace(20),
                PostCommunityApp(
                  profileImage: 'assets/images/person3.png',
                  profileName: 'yamen ali',
                  postDate: '3 June at 1:00',
                  yourMain: 'Advice',
                  yourMainColor: Color(0xfffee2bb),
                  postText: "#TakeCareOfYourHealth",
                  postImage: "assets/images/post.png",
                ),
                verticalSpace(20),
                PostCommunityApp(
                  profileImage: 'assets/images/person4.png',
                  profileName: 'Asmaa saied',
                  postDate: '3 July at 19:56',
                  yourMain: 'Healing stories',
                  yourMainColor: Color(0xffcff5df),
                  postText:
                      "Kidney disease can be silent—regular check-ups save lives! Take care of your health. 💙 #AwarenessPost",
                ),
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
