import 'package:get/get.dart';

import 'package:app_flutter/app/modules/about/bindings/about_binding.dart';
import 'package:app_flutter/app/modules/about/views/about_view.dart';
import 'package:app_flutter/app/modules/home/bindings/home_binding.dart';
import 'package:app_flutter/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
