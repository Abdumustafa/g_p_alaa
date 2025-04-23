import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/modal_bottom_sheet.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/profile_image.dart';

class PostCommunityApp extends StatelessWidget {
  const PostCommunityApp({
    super.key,
    required this.profileImage,
    required this.profileName,
    required this.postDate,
    required this.yourMain,
    required this.yourMainColor,
    required this.postText,
    this.postImage,
  });
  final String profileImage;
  final String profileName;
  final String postDate;
  final String yourMain;
  final Color yourMainColor;
  final String postText;
  final String? postImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade100,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Row(
                children: [
                  ProfileImage(
                    image: profileImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(profileName,
                            style: TextStyles.font20greyregularMerriweather),
                        verticalSpace(4),
                        Row(
                          children: [
                            Text("$postDate ",
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey)),
                            SvgPicture.asset(
                              'assets/images/earth.svg',
                              height: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: yourMainColor),
                    child: Padding(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        child: Text(
                          yourMain,
                          style: TextStyles.font20greyregularMerriweather,
                        )),
                  ),
                  horizontalSpace(8),
                  Icon(
                    Icons.more_vert_rounded,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 12),
              child: Text(
                postText,
                style: TextStyles.font20greyregularMerriweather,
              ),
            ),
            if (postImage?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: postImage!.startsWith('http')
                        ? SvgPicture.asset(
                            'assets/images/earth.svg',
                            height: 1,
                          )
                        : Image.asset(
                            postImage!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
              ),
            Divider(
              color: Colors.grey.shade100,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              child: GestureDetector(
                onTap: () {
                  ModalBottomSheet(context);
                },
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/like_icon.svg',
                        height: 18,
                      ),
                      Text(
                        "  7      ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SvgPicture.asset(
                        'assets/images/comment_icon.svg',
                        height: 15,
                      ),
                      Text(
                        "  5 ",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
