import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:app_flutter/global_widgets/common/loading.dart';
import 'package:app_flutter/app/modules/home/controllers/coinschedule_controller.dart';
import 'package:app_flutter/core/datasource/coin_schedule_datasource.dart';

class CoinSchedule extends GetView<CoinScheduleController> {
  @override
  final CoinScheduleController controller = Get.put(CoinScheduleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white24,
            body: GetBuilder<CoinScheduleController>(
                builder: (_) => controller.isLoading.value
                    ? Loading()
                    : SafeArea(
                        child: SfCalendar(
                        view: CalendarView.month,
                        dataSource: CoinScheduleDataSource(controller.list),
                        monthViewSettings: MonthViewSettings(showAgenda: true),
                      )))));
  }
}
