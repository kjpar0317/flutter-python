import 'package:get/get.dart';

import 'package:app_flutter/models/coin_trend.dart';
import 'package:app_flutter/services/coin_services.dart';

class CoinTrendsController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxList<CoinTrend> _list = <CoinTrend>[].obs;

  RxBool get isLoading => _isLoading;
  RxList<CoinTrend> get list => _list;

  @override
  void onInit() {
    super.onInit();
    fetchCoinTrends();
  }

  @override
  void onClose() {}

  void fetchCoinTrends() async {
    try {
      isLoading(true);
      var coinTrends = await CoinServices.fetchCoinTrends();
      if (coinTrends != null) {
        _list.value = coinTrends;
      }
    } finally {
      isLoading(false);
    }
  }
}
