import 'dart:convert';

class CoinSchedule {
  String id;
  String coin;
  String date;
  String date_to;
  String name;
  String description;
  bool is_conference;
  String link;
  String proof_image_link;

  CoinSchedule({
    required this.id,
    required this.coin,
    required this.date,
    required this.date_to,
    required this.name,
    required this.description,
    required this.is_conference,
    required this.link,
    required this.proof_image_link,
  });

  CoinSchedule copyWith({
    String? id,
    String? coin,
    String? date,
    String? date_to,
    String? name,
    String? description,
    bool? is_conference,
    String? link,
    String? proof_image_link,
  }) {
    return CoinSchedule(
      id: id ?? this.id,
      coin: coin ?? this.coin,
      date: date ?? this.date,
      date_to: date_to ?? this.date_to,
      name: name ?? this.name,
      description: description ?? this.description,
      is_conference: is_conference ?? this.is_conference,
      link: link ?? this.link,
      proof_image_link: proof_image_link ?? this.proof_image_link,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'coin': coin});
    result.addAll({'date': date});
    result.addAll({'date_to': date_to});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'is_conference': is_conference});
    result.addAll({'link': link});
    result.addAll({'proof_image_link': proof_image_link});

    return result;
  }

  factory CoinSchedule.fromMap(Map<String, dynamic> map) {
    return CoinSchedule(
      id: map['id'] ?? '',
      coin: map['coin'] ?? '',
      date: map['date'] ?? '',
      date_to: map['date_to'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      is_conference: map['is_conference'] ?? false,
      link: map['link'] ?? '',
      proof_image_link: map['proof_image_link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinSchedule.fromJson(String source) =>
      CoinSchedule.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoinSchedule(id: $id, coin: $coin, date: $date, date_to: $date_to, name: $name, description: $description, is_conference: $is_conference, link: $link, proof_image_link: $proof_image_link)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoinSchedule &&
        other.id == id &&
        other.coin == coin &&
        other.date == date &&
        other.date_to == date_to &&
        other.name == name &&
        other.description == description &&
        other.is_conference == is_conference &&
        other.link == link &&
        other.proof_image_link == proof_image_link;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        coin.hashCode ^
        date.hashCode ^
        date_to.hashCode ^
        name.hashCode ^
        description.hashCode ^
        is_conference.hashCode ^
        link.hashCode ^
        proof_image_link.hashCode;
  }
}
