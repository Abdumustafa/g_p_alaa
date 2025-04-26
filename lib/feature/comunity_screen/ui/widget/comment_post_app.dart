// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/theming/font_weight_helper.dart';
import 'package:g_p_alaa/core/theming/styles.dart';

class CommentPostApp extends StatefulWidget {
  CommentPostApp({
    Key? key,
    required this.profileImage,
    required this.profileName,
    required this.commentDate,
    required this.commentText,
    this.commentImage,
  }) : super(key: key);
  final String profileImage;
  final String profileName;
  final String commentDate;
  final String commentText;
  final String? commentImage;

  @override
  State<CommentPostApp> createState() => _CommentPostAppState();
}

class _CommentPostAppState extends State<CommentPostApp> {
  @override
  Widget build(BuildContext context) {
    bool isLiked = false;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profileImage),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xfff4f9fe)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "profileName",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeightHelper.bold,
                                          color: Colors.black,
                                          fontFamily: "Merriweather",
                                        ),
                                      ),
                                      verticalSpace(5),
                                      Text(" ${widget.commentDate}",
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blueGrey)),
                                    ],
                                  ),
                                  horizontalSpace(160),
                                  Icon(
                                    Icons.more_horiz_rounded,
                                    color: Colors.blueGrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(14),
                                width: 280,
                                child: Text(
                                  widget.commentText,
                                  style: TextStyles.font18BlackboldMerriweather,
                                ),
                              ),
                              if (widget.commentImage != null &&
                                  widget.commentImage!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      widget.commentImage!,
                                      width: 250,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Icon(Icons.image_not_supported,
                                            size: 50, color: Colors.grey);
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, top: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: Container(
                  color: Colors.white,
                  child: SvgPicture.asset(
                    'assets/images/like_icon.svg',
                    height: 18,
                    color: isLiked ? Colors.red : Colors.grey,
                  ),
                ),
              ),
              horizontalSpace(10),
              Text(
                "Like",
                style: TextStyle(color: Colors.blueGrey),
              ),
              horizontalSpace(20),
              SvgPicture.asset(
                'assets/images/Vector.svg',
                height: 15,
              ),
              horizontalSpace(10),
              Text(
                "Reply",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
