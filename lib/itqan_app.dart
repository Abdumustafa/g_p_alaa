import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_alaa/core/routing/router.dart';
import 'package:g_p_alaa/core/theming/colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class Community extends StatelessWidget {
 const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        getPages: AppRouter.routes,
        initialRoute: AppRouter.initialRoute,
        title: "ItqanApp",
        theme: ThemeData(
          primaryColor: ColorsManager.Amber,
              fontFamily: "Cairo",

        ),
        debugShowCheckedModeBanner: false,
       
      ),
    );
  }
}
