import 'package:g_p_alaa/core/helper/api.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/post_model.dart';

class AllPostsServices {

  Future<List<PostModel>> getAllPosts() async {
    print("1");
    Map<String, dynamic> data = await ApiMethod().get(
      url: "https://renalyze-amiras-projects-2023fd67.vercel.app/post/all",
    );

    List<dynamic> results = data['results']; 
    List<PostModel> postList = [];
     for (int i = 0; i < results.length; i++) {
      final jsonItem = results[i];
      if (jsonItem != null) {
         postList.add(PostModel.fromJson(jsonItem));
      }
    }
    print(postList.length);
    return postList;
  }
}
