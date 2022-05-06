import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:app_flutter/global_widgets/common/loading.dart';
import 'package:app_flutter/global_widgets/card/icon_text_card.dart';
import 'package:app_flutter/app/modules/home/controllers/coinnews_controller.dart';

class Dashboard extends GetView<CoinNewsController> {
  @override
  final CoinNewsController controller = Get.put(CoinNewsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white24,
      body: GetBuilder<CoinNewsController>(
        builder: (_) => controller.isLoading.value
            ? Loading()
            : LayoutBuilder(builder: (context, constraints) {
                return MasonryGridView.count(
                  crossAxisCount: (constraints.maxWidth < 600)
                      ? 2
                      : (constraints.maxWidth < 800)
                          ? 3
                          : 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 12,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return IconTextCard(
                        icons: List<String>.from(controller.list[index].tags
                            .map((tag) => tag['icon'])
                            .toList()),
                        topText: controller.list[index].title,
                        middleText: controller.list[index].description,
                        bottomText: controller.list[index].date);
                  },
                );
              }),
      ),
    ));
  }
}
