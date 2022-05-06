import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universal_platform/universal_platform.dart';

import 'package:app_flutter/models/coin_news.dart';
import 'package:app_flutter/models/coin_schedule.dart';
import 'package:app_flutter/models/coin_trend.dart';

class CoinServices {
  static var client = http.Client();

  static Future<List<CoinNews?>?> fetchCoinNews() async {
    final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';

    final response =
        await client.get(Uri.parse('http://$host:8000/api/coin/news'));

    var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (jsonBody != null) {
      return (jsonBody as List).map((i) => CoinNews.fromMap(i)).toList();
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<CoinSchedule>?> fetchCoinSchedule() async {
    final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';

    final response =
        await client.get(Uri.parse('http://$host:8000/api/coin/schedule'));

    var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (jsonBody != null) {
      // print(jsonBody);
      return (jsonBody as List).map((i) => CoinSchedule.fromMap(i)).toList();
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<CoinTrend>?> fetchCoinTrends() async {
    final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';

    final response =
        await client.get(Uri.parse('http://$host:8000/api/coin/trends'));

    var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (jsonBody != null) {
      // print(jsonBody);
      return (jsonBody as List).map((i) => CoinTrend.fromMap(i)).toList();
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
