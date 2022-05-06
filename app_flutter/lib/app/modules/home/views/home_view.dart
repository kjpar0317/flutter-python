import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:app_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:app_flutter/app/modules/home/widgets/Dashboard.dart';
import 'package:app_flutter/app/modules/home/widgets/CoinSchedule.dart';
import 'package:app_flutter/app/modules/home/widgets/CoinTrends.dart';
import 'package:app_flutter/app/modules/home/widgets/AIAnalysis.dart';
import 'package:app_flutter/app/modules/home/widgets/Community.dart';

class HomeView extends GetView<HomeController> {
  @override
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();

    return Scaffold(
        // resizeToAvoidBottomInset: true,
        appBar: AppBar(
          systemOverlayStyle: Get.isDarkMode
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          title: Text(
            'COININFOS',
            style: TextStyle(fontSize: 18.sp),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.light_mode),
              tooltip: '테마변경',
              onPressed: () => {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.light() : ThemeData.dark())
              },
            ),
            IconButton(
              icon: Icon(Icons.login),
              tooltip: '로그인',
              onPressed: () => Get.toNamed('/about')
            ),
            IconButton(
              icon: Icon(Icons.app_registration),
              tooltip: '회원가입',
              onPressed: () => Get.toNamed('/about')
            )
          ],
        ),
        body: Obx(() => IndexedStack(
              index: controller.currentIndex.value,
              children: <Widget>[
                Dashboard(),
                CoinSchedule(),
                CoinTrends(),
                AIAnalysis(),
                Community(),
              ],
            )),
        bottomNavigationBar: Obx(() => BottomNavyBar(
              selectedIndex: controller.currentIndex.value,
              showElevation: true, // use this to remove appBar's elevation
              onItemSelected: (index) {
                controller.setCurrentIndex(index);

                if (_controller.hasClients) {
                  _controller.animateToPage(index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.dashboard),
                  title: Text('대시보드'),
                  activeColor: Colors.red,
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.event_note),
                    title: Text('스케줄'),
                    activeColor: Colors.purpleAccent),
                BottomNavyBarItem(
                    icon: Icon(Icons.whatshot),
                    title: Text('트렌드'),
                    activeColor: Colors.pink),
                BottomNavyBarItem(
                    icon: Icon(Icons.psychology),
                    title: Text('AI분석'),
                    activeColor: Colors.blue),
                BottomNavyBarItem(
                    icon: Icon(Icons.message),
                    title: Text('커뮤니티'),
                    activeColor: Colors.blueGrey),
              ],
            )));
  }
}
