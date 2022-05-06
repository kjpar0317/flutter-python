import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:app_flutter/app/modules/home/controllers/community_controller.dart';

class Community extends GetView<CommunityController> {
  @override
  final CommunityController controller = Get.put(CommunityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.grey[400],
          padding: EdgeInsets.all(16.0),
          child: PlutoGrid(
            columns: controller.columns,
            rows: controller.rows,
            onChanged: (PlutoGridOnChangedEvent event) {
              print(event);
            },
            configuration: Get.isDarkMode
                ? const PlutoGridConfiguration.dark()
                : PlutoGridConfiguration(),
          )),
    );
  }
}
