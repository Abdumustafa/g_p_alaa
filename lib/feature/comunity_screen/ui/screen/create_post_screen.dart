import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_alaa/core/helper/spaces.dart';
import 'package:g_p_alaa/core/theming/font_weight_helper.dart';
import 'package:g_p_alaa/core/theming/styles.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/profile_image.dart';
import 'package:g_p_alaa/feature/comunity_screen/ui/widget/tgs_box_text.dart';
import 'package:get/get.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});

  final RxString selectedOption = "None".obs;
  final RxBool isTagsVisible = false.obs;
  final RxBool isPostEnabled = false.obs;
  final TextEditingController postController = TextEditingController();

  Color getTagColor(String tag) {
    switch (tag) {
      case "Healing stories":
        return Color(0xffc9e9d6);
      case "Question":
        return Color(0xffd5dbf5);
      case "Advice":
        return Color(0xfffee2bb);
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(60),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "   Create post",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.bold,
                      color: Color(0xff666666),
                      fontFamily: "Merriweather",
                    ),
                  ),
                  Spacer(),
                  Obx(() => Container(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: isPostEnabled.value ? () {} : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isPostEnabled.value
                                ? Colors.blue
                                : Colors.blueGrey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            shadowColor: Colors.blue.withOpacity(0.5),
                          ),
                          child: Text(
                            "post",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Merriweather",
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              verticalSpace(20),
              Row(
                children: [
                  ProfileImage(image: "assets/images/person8.png"),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: 230,
                      constraints: BoxConstraints(
                        minHeight: 40,
                        maxHeight: 150,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: postController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        onChanged: (value) {
                          isPostEnabled.value = value.trim().isNotEmpty;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: InputBorder.none,
                          hintText: "What's on your mind?",
                          hintStyle: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Obx(() => selectedOption.value != "None"
                      ? Container(
                          alignment: Alignment.center,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: getTagColor(selectedOption.value),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              selectedOption.value,
                              style: TextStyles.font20greyregularMerriweather,
                            ),
                          ),
                        )
                      : SizedBox()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      isTagsVisible.value = !isTagsVisible.value;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      shadowColor: Colors.blue.withOpacity(0.5),
                    ),
                    child: Text(
                      "Add tags",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Merriweather",
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(() => isTagsVisible.value
                  ? Column(
                      children: [
                        RadioListTile(
                          title:
                              TagsBoxText(tag: 'None', tagColor: Colors.white),
                          value: "None",
                          groupValue: selectedOption.value,
                          onChanged: (value) {
                            selectedOption.value = value!;
                            isTagsVisible.value = false;
                          },
                        ),
                        RadioListTile(
                          title: TagsBoxText(
                              tag: 'Healing stories',
                              tagColor: Color(0xffc9e9d6)),
                          value: "Healing stories",
                          groupValue: selectedOption.value,
                          onChanged: (value) {
                            selectedOption.value = value!;
                            isTagsVisible.value = false;
                          },
                        ),
                        RadioListTile(
                          title: TagsBoxText(
                              tag: 'Question', tagColor: Color(0xffd5dbf5)),
                          value: "Question",
                          groupValue: selectedOption.value,
                          onChanged: (value) {
                            selectedOption.value = value!;
                            isTagsVisible.value = false;
                          },
                        ),
                        RadioListTile(
                          title: TagsBoxText(
                              tag: 'Advice', tagColor: Color(0xfffee2bb)),
                          value: "Advice",
                          groupValue: selectedOption.value,
                          onChanged: (value) {
                            selectedOption.value = value!;
                            isTagsVisible.value = false;
                          },
                        ),
                      ],
                    )
                  : SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
