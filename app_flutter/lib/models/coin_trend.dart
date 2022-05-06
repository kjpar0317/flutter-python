import 'dart:convert';

import 'package:collection/collection.dart';

class CoinTrend {
  int id;
  int dataType;
  String name;
  String symbol;
  int rank;
  String status;
  double marketCap;
  double selfReportedMarketCap;
  Map<String, double> priceChange;

  CoinTrend({
    required this.id,
    required this.dataType,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.status,
    required this.marketCap,
    required this.selfReportedMarketCap,
    required this.priceChange,
  });

  CoinTrend copyWith({
    int? id,
    int? dataType,
    String? name,
    String? symbol,
    int? rank,
    String? status,
    double? marketCap,
    double? selfReportedMarketCap,
    Map<String, double>? priceChange,
  }) {
    return CoinTrend(
      id: id ?? this.id,
      dataType: dataType ?? this.dataType,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      rank: rank ?? this.rank,
      status: status ?? this.status,
      marketCap: marketCap ?? this.marketCap,
      selfReportedMarketCap:
          selfReportedMarketCap ?? this.selfReportedMarketCap,
      priceChange: priceChange ?? this.priceChange,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'dataType': dataType});
    result.addAll({'name': name});
    result.addAll({'symbol': symbol});
    result.addAll({'rank': rank});
    result.addAll({'status': status});
    result.addAll({'marketCap': marketCap});
    result.addAll({'selfReportedMarketCap': selfReportedMarketCap});
    result.addAll({'priceChange': priceChange});

    return result;
  }

  factory CoinTrend.fromMap(Map<String, dynamic> map) {
    return CoinTrend(
      id: map['id']?.toInt() ?? 0,
      dataType: map['dataType']?.toInt() ?? 0,
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      rank: map['rank']?.toInt() ?? 0,
      status: map['status'] ?? '',
      marketCap: map['marketCap']?.toDouble() ?? 0.0,
      selfReportedMarketCap: map['selfReportedMarketCap']?.toDouble() ?? 0.0,
      priceChange: Map<String, double>.from(map['priceChange']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinTrend.fromJson(String source) =>
      CoinTrend.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinTrend(id: $id, dataType: $dataType, name: $name, symbol: $symbol, rank: $rank, status: $status, marketCap: $marketCap, selfReportedMarketCap: $selfReportedMarketCap, priceChange: $priceChange)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is CoinTrend &&
        other.id == id &&
        other.dataType == dataType &&
        other.name == name &&
        other.symbol == symbol &&
        other.rank == rank &&
        other.status == status &&
        other.marketCap == marketCap &&
        other.selfReportedMarketCap == selfReportedMarketCap &&
        mapEquals(other.priceChange, priceChange);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        dataType.hashCode ^
        name.hashCode ^
        symbol.hashCode ^
        rank.hashCode ^
        status.hashCode ^
        marketCap.hashCode ^
        selfReportedMarketCap.hashCode ^
        priceChange.hashCode;
  }
}
