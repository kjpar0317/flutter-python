import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/custom_theme.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_) {
        return ResponsiveSizer(builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            builder: (context, widget) {
              ScreenUtil.init(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            theme: getTheme(context, Get.isDarkMode),
            darkTheme: getTheme(context, Get.isDarkMode),
          );
        });
      },
    ),
  );
}

// void main() {
//   runApp(
//     ScreenUtilInit(
//       designSize: Size(375, 812),
//       builder: (BuildContext c) {
//         return GetMaterialApp(
//           title: "Application",
//           initialRoute: AppPages.INITIAL,
//           getPages: AppPages.routes,
//           theme: getTheme(c, true),
//           darkTheme: getTheme(c, Get.isDarkMode),
//         );
//       },
//     ),
//   );
// }