import 'dart:convert';

import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  const CountryModel({
    required super.id,
    required super.flagUrl,
    required super.name,
    required super.isBlacklisted,
    super.reason,
  });

  CountryModel copyWith({
    int? id,
    String? name,
    String? flagUrl,
    String? reason,
    bool? isBlacklisted,
  }) {
    return CountryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      flagUrl: flagUrl ?? this.flagUrl,
      reason: reason ?? this.reason,
      isBlacklisted: isBlacklisted ?? this.isBlacklisted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'flagUrl': flagUrl,
      'reason': reason,
      'isBlacklisted': isBlacklisted,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      flagUrl: map['flagUrl'] ?? '',
      reason: map['reason'],
      isBlacklisted: map['isBlacklisted'] ?? true,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, flagUrl: $flagUrl, reason: $reason, isBlacklisted: $isBlacklisted)';
  }
}
