import 'dart:convert';

import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.name,
    required super.logoUrl,
  });

  CompanyModel copyWith({
    int? id,
    String? name,
    String? logoUrl,
  }) {
    return CompanyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyModel.fromJson(String source) =>
      CompanyModel.fromMap(json.decode(source));

  @override
  String toString() => 'CompanyEntity(id: $id, name: $name, logoUrl: $logoUrl)';
}
