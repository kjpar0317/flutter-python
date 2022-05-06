import 'package:get/get.dart';

import 'package:app_flutter/models/coin_schedule.dart';
import 'package:app_flutter/services/coin_services.dart';

class CoinScheduleController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxList<CoinSchedule> _list = <CoinSchedule>[].obs;

  RxBool get isLoading => _isLoading;
  RxList<CoinSchedule> get list => _list;

  @override
  void onInit() {
    super.onInit();
    fetchCoinSchedule();
  }

  @override
  void onClose() {}

  void fetchCoinSchedule() async {
    try {
      isLoading(true);
      var coinSchedule = await CoinServices.fetchCoinSchedule();
      if (coinSchedule != null) {
        _list.value = coinSchedule;
      }
    } finally {
      isLoading(false);
    }
  }
}
