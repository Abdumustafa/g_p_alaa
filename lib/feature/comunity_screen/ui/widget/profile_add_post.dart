import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/profile_image.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileAndAddPost extends StatelessWidget {
  const ProfileAndAddPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ProfileImage(
              image: 'assets/images/person1.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/CreatePostScreen");
            },
            child: Container(
              height: 40,
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade100,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Text("What’s on your mind?",
                      style: TextStyles.font20greyregularMerriweather),
                  horizontalSpace(100),
                  SvgPicture.asset(
                    'assets/images/icon_photo.svg',
                  ),
                  Icon(
                    Icons.more_vert_rounded,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
