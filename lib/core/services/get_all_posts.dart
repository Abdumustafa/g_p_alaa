import 'package:g_p_alaa/core/helper/api.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/post_model.dart';

class AllPostsServices {
  Future<List<PostModel>> getAllPosts() async {
    Map<String, dynamic> data = await ApiMethod().get(
      url: "https://renalyze-amiras-projects-2023fd67.vercel.app/post/all",
    );

    List<PostModel> postList = [];
    for (int i = 0; i < data.length; i++) {
      postList.add(
        PostModel.fromJson(data[i]),
      );
    }
    return postList;
  }
}
