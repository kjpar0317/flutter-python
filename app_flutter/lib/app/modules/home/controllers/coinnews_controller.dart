import 'package:get/get.dart';

import 'package:app_flutter/models/coin_news.dart';
import 'package:app_flutter/services/coin_services.dart';

class CoinNewsController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxList _list = <CoinNews>[].obs;

  RxBool get isLoading => _isLoading;
  RxList get list => _list;

  @override
  void onInit() {
    super.onInit();
    fetchCoinNews();
  }

  @override
  void onClose() {}

  void fetchCoinNews() async {
    try {
      isLoading(true);
      var coinNews = await CoinServices.fetchCoinNews();
      if (coinNews != null) {
        _list.value = coinNews;
      }
    } finally {
      isLoading(false);
    }
  }
}
