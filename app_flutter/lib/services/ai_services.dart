import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:universal_platform/universal_platform.dart';


class AIServices {
  static var client = http.Client();

  static Future<Map<String, dynamic>> fetchAiSentiment(String coin) async {
    final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';

    final response = await client.get(
        Uri.parse('http://$host:8000/api/ai/sentiment')
            .replace(queryParameters: {'coin': coin}));

    var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (jsonBody != null) {
      return jsonBody;
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  static Future<Map<String, dynamic>> fetchAiAnalysis(String coin) async {
    final host = UniversalPlatform.isAndroid ? '10.0.2.2' : '127.0.0.1';

    final response = await client.get(
        Uri.parse('http://$host:8000/api/ai/analysis')
            .replace(queryParameters: {'coin': coin}));

    var jsonBody = jsonDecode(utf8.decode(response.bodyBytes));

    if (jsonBody != null) {
      return jsonBody;
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}
