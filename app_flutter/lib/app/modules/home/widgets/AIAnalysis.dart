import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:app_flutter/app/modules/home/controllers/aicoin_controller.dart';

class AIAnalysis extends GetView<AICoinController> {
  @override
  final AICoinController controller = Get.put(AICoinController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white24,
            body: Obx(
              () => Column(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Card(
                        child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: DropdownButton<dynamic>(
                                          value: controller.selected.value,
                                          onChanged: (newValue) {
                                            controller.setSelected(newValue);
                                          },
                                          items: AICoinController
                                              .getDropdownMenuItems()))
                                ]))),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Card(
                        child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: PieChart(
                        PieChartData(sections: controller.list),
                        swapAnimationCurve: Curves.linear, // Optional
                      ),
                    )),
                  ),
                  Flexible(
                      flex: 5,
                      fit: FlexFit.tight,
                      child: Card(
                          child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: BarChart(BarChartData(
                            maxY: 5,
                            titlesData: FlTitlesData(
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: bottomTitles,
                                  reservedSize: 42,
                                ),
                              ),
                            ),
                            groupsSpace: 10,
                            borderData: FlBorderData(
                              show: false,
                            ),
                            gridData: FlGridData(show: false),
                            barGroups: controller.list2)),
                      ))),
                  Flexible(
                      flex: 3,
                      fit: FlexFit.tight,
                      child: Card(
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 2, 2, 2),
                                          child: Text(
                                              controller
                                                  .botMap["RecomendedAction"]
                                                  .toString()
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                  color: (controller.botMap[
                                                              "RecomendedAction"] ==
                                                          "buy"
                                                      ? Colors.green[400]
                                                      : Colors.red[400])))),
                                      Flexible(
                                          child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 2, 2, 2),
                                              child: Text(
                                                  controller
                                                      .botMap["ReasonFound"],
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14)))))
                                    ],
                                  )
                                ],
                              )))),
                ],
              ),
            )));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(controller.bottomTitles[value.toInt()],
            style: TextStyle(
              color: Color(0xff7589a2),
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(14),
            )));
  }
}
