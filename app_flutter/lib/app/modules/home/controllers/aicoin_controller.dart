import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:app_flutter/core/utils/coin_utils.dart';
import 'package:app_flutter/services/ai_services.dart';

class AICoinController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxString _selected = "BTC".obs;
  final RxList<PieChartSectionData> _list = <PieChartSectionData>[].obs;
  final RxList<BarChartGroupData> _list2 = <BarChartGroupData>[].obs;
  final RxList<String> _bottomTitles = <String>[].obs;
  final RxMap<String, dynamic> _botMap = <String, dynamic>{}.obs;

  RxBool get isLoading => _isLoading;
  RxString get selected => _selected;
  RxList<PieChartSectionData> get list => _list;
  RxList<BarChartGroupData> get list2 => _list2;
  RxList<String> get bottomTitles => _bottomTitles;
  RxMap<String, dynamic> get botMap => _botMap;

  @override
  void onInit() {
    super.onInit();
    fetchAiSentiment("BTC");
    fetchAiAnalysis("BTC");
  }

  @override
  void onClose() {}

  void fetchAiSentiment(String coin) async {
    try {
      isLoading(true);
      Map<String, dynamic> aiSentiment =
          await AIServices.fetchAiSentiment(coin);

      List<PieChartSectionData> pieList = [];
      List<BarChartGroupData> barGroupList = [];
      List<String> bottomTitles = [];
      int j = 0;

      pieList.add(PieChartSectionData(
          title: "긍정적",
          value: double.parse(aiSentiment['Sentiment'].toString()),
          color: Colors.green[400]));
      pieList.add(PieChartSectionData(
          title: "부정적",
          value: 100 - double.parse(aiSentiment['Sentiment'].toString()),
          color: Colors.red[400]));

      for (int i = 0; i < aiSentiment['RelatedArticles'].length; i++) {
        Map<String, dynamic> tempData = aiSentiment['RelatedArticles'][i];

        if (tempData['Sentiment']['positive'].length > 0 ||
            tempData['Sentiment']['negative'].length > 0) {
          barGroupList.add(BarChartGroupData(x: j, barsSpace: 4, barRods: [
            BarChartRodData(
                toY: tempData['Sentiment']['positive'].length,
                color: Colors.green[400],
                width: 2),
            BarChartRodData(
                toY: tempData['Sentiment']['negative'].length,
                color: Colors.red[400],
                width: 2)
          ]));

          bottomTitles.add("a-" + (i + 1).toString());
          j++;
        }
      }

      _list.value = pieList;
      _list2.value = barGroupList;
      _bottomTitles.value = bottomTitles;
    } finally {
      isLoading(false);
    }
  }

  void fetchAiAnalysis(String coin) async {
    try {
      isLoading(true);
      Map<String, dynamic> botMap = await AIServices.fetchAiAnalysis(coin);

      _botMap.value = botMap;
    } finally {
      isLoading(false);
    }
  }

  static List<DropdownMenuItem<dynamic>> getDropdownMenuItems() {
    List<DropdownMenuItem> results = [];
    List<String> coins = CoinUtils.search_coins;

    for (int i = 0; i < coins.length; i++) {
      String coinnm = CoinUtils.convertCoinIdToNm(coins[i]);
      results.add(DropdownMenuItem(child: Text(coinnm), value: coinnm));
    }

    return results;
  }

  void setSelected(value) {
    _selected.value = value;
    fetchAiSentiment(value);
    fetchAiAnalysis(value);
  }
}
