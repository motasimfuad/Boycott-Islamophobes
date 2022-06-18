import 'dart:convert';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required int id,
    required String name,
    required String logoUrl,
    required String? countryName,
    required int categoryId,
    required int countryId,
    String? reason,
  }) : super(
          id: id,
          name: name,
          logoUrl: logoUrl,
          categoryId: categoryId,
          countryName: countryName,
          countryId: countryId,
          reason: reason,
        );

  ProductModel copyWith({
    int? id,
    String? name,
    String? logoUrl,
    String? countryName,
    int? categoryId,
    int? countryId,
    String? reason,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      countryName: countryName ?? this.countryName,
      categoryId: categoryId ?? this.categoryId,
      countryId: countryId ?? this.countryId,
      reason: reason ?? this.reason,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'categoryId': categoryId,
      'countryId': countryId,
      'reason': reason,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
      countryName: map['countryName'],
      categoryId: map['categoryId']?.toInt() ?? 0,
      countryId: map['countryId']?.toInt() ?? 0,
      reason: map['reason'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, logoUrl: $logoUrl, categoryId: $categoryId, countryId: $countryId, reason: $reason, countryName: $countryName)';
  }
}
