import 'dart:convert';

import 'package:collection/collection.dart';

class CoinNews {
  String title;
  String link;
  String description;
  String source;
  String date;
  List<Map<String, dynamic>> tags;

  CoinNews({
    required this.title,
    required this.link,
    required this.description,
    required this.source,
    required this.date,
    required this.tags,
  });

  CoinNews copyWith({
    String? title,
    String? link,
    String? description,
    String? source,
    String? date,
    List<Map<String, dynamic>>? tags,
  }) {
    return CoinNews(
      title: title ?? this.title,
      link: link ?? this.link,
      description: description ?? this.description,
      source: source ?? this.source,
      date: date ?? this.date,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'link': link});
    result.addAll({'description': description});
    result.addAll({'source': source});
    result.addAll({'date': date});
    result.addAll({'tags': tags});

    return result;
  }

  factory CoinNews.fromMap(Map<String, dynamic> map) {
    return CoinNews(
      title: map['title'] ?? '',
      link: map['link'] ?? '',
      description: map['description'] ?? '',
      source: map['source'] ?? '',
      date: map['date'] ?? '',
      tags: List<Map<String, dynamic>>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinNews.fromJson(String source) =>
      CoinNews.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinNews(title: $title, link: $link, description: $description, source: $source, date: $date, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other is CoinNews &&
        other.title == title &&
        other.link == link &&
        other.description == description &&
        other.source == source &&
        other.date == date &&
        mapEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        link.hashCode ^
        description.hashCode ^
        source.hashCode ^
        date.hashCode ^
        tags.hashCode;
  }
}
