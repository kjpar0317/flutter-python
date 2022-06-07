import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/custom_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext scontext, child) => GetMaterialApp(
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              builder: (ctx, widget) {
                // ScreenUtil.init(ctx);

                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(ctx).copyWith(textScaleFactor: 0.8),
                  child: widget!,
                );
              },
              theme: getTheme(scontext, Get.isDarkMode),
              darkTheme: getTheme(scontext, Get.isDarkMode),
            ));
  }
}
