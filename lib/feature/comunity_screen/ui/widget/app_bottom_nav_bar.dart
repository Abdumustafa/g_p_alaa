import 'package:flutter/material.dart';
import 'package:g_p_alaa/core/services/get_all_posts.dart';
// import 'package:http/http.dart' as http;

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        color: Colors.grey.shade50,
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () async {
              // const String token =
              //     'TOKEN__eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImFtaXJhQGdtYWlsLmNvbSIsImlhdCI6MTc0MTk1MzE4Nn0.IWiPhNrbOsKw8wWjcdojOJj9M7ot_pOwSvAuoyN7anY';
              // http.Response response = await http.get(
              //     Uri.parse(
              //         "https://renalyze-amiras-projects-2023fd67.vercel.app/post/all"),
              //     headers: {
              //       'token': '$token',
              //     });
              AllPostsServices().getAllPosts();
            },
            child: Icon(
              Icons.home_sharp,
              size: 30,
              color: Colors.grey,
            ),
          ),
          Icon(
            Icons.history,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
