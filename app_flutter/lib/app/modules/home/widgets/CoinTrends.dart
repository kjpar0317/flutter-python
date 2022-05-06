import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:app_flutter/global_widgets/common/loading.dart';
import 'package:app_flutter/models/coin_trend.dart';
import 'package:app_flutter/app/modules/home/controllers/cointrends_controller.dart';

class CoinTrends extends GetView<CoinTrendsController> {
  @override
  final CoinTrendsController controller = Get.put(CoinTrendsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white24,
            body: GetBuilder<CoinTrendsController>(
                builder: (_) => controller.isLoading.value
                    ? Loading()
                    : ListView.builder(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        itemCount: controller.list.length,
                        itemBuilder: (context, position) {
                          CoinTrend item = controller.list[position];
                          double volume24h =
                              item.priceChange['volume24h']!.toDouble();
                          double price = item.priceChange['price']!.toDouble();
                          double priceChange24h =
                              item.priceChange['priceChange24h']!.toDouble();
                          double priceChange7d =
                              item.priceChange['priceChange7d']!.toDouble();
                          double priceChange30d =
                              item.priceChange['priceChange7d']!.toDouble();

                          return Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                child: StaggeredGrid.count(
                                  crossAxisCount: 6,
                                  mainAxisSpacing: 1,
                                  crossAxisSpacing: 1,
                                  children: [
                                    StaggeredGridTile.count(
                                        crossAxisCellCount: 1,
                                        mainAxisCellCount: 1,
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                            color: item.priceChange[
                                                            "priceChange7d"]!
                                                        .toDouble() >=
                                                    0
                                                ? Colors.green[300]
                                                : Colors.red[300],
                                            child: Row(children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    5, 5, 5, 5),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        item.symbol,
                                                        style: TextStyle(
                                                            fontSize: 15.sp),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      Text(item.rank.toString(),
                                                          style: TextStyle(
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.center)
                                                    ]),
                                              )
                                            ]))),
                                    StaggeredGridTile.count(
                                        crossAxisCellCount: 4,
                                        mainAxisCellCount: 1,
                                        child: Row(children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 5, 5, 5),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      item.name +
                                                          " - 24시간 볼륨: $volume24h",
                                                      style: TextStyle(
                                                          fontSize: 12.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Text(
                                                      "가격: $price, 24시간변동: $priceChange24h",
                                                      style: TextStyle(
                                                          fontSize: 12.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                  Text(
                                                      "7일간변동: $priceChange7d, 30일간변동: $priceChange30d",
                                                      style: TextStyle(
                                                          fontSize: 12.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                ]),
                                          )
                                        ])),
                                    StaggeredGridTile.count(
                                        crossAxisCellCount: 1,
                                        mainAxisCellCount: 1,
                                        child: Text(item.status,
                                            style: TextStyle(
                                                color: item.status == 'active'
                                                    ? Colors.green[300]
                                                    : Colors.red[300],
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.center)),
                                  ],
                                ),
                              ));
                        }))));
  }
}
