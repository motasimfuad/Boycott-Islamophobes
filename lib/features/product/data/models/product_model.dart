import 'dart:convert';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.logoUrl,
    required super.countryName,
    required super.countryId,
    required super.categoryName,
    required super.categoryId,
    super.companyName,
    super.companyId,
    super.reason,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? logoUrl,
    String? countryName,
    int? countryId,
    String? categoryName,
    int? categoryId,
    String? companyName,
    int? companyId,
    String? reason,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      countryName: countryName ?? this.countryName,
      countryId: countryId ?? this.countryId,
      categoryName: categoryName ?? this.categoryName,
      categoryId: categoryId ?? this.categoryId,
      companyName: companyName ?? this.companyName,
      companyId: companyId ?? this.companyId,
      reason: reason ?? this.reason,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'countryName': countryName,
      'countryId': countryId,
      'categoryName': categoryName,
      'categoryId': categoryId,
      'companyName': companyName,
      'companyId': companyId,
      'reason': reason,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
      countryName: map['countryName'] ?? '',
      countryId: map['countryId']?.toInt() ?? 0,
      categoryName: map['categoryName'] ?? '',
      categoryId: map['categoryId']?.toInt() ?? 0,
      companyName: map['companyName'],
      companyId: map['companyId']?.toInt(),
      reason: map['reason'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, logoUrl: $logoUrl, countryName: $countryName, countryId: $countryId, categoryName: $categoryName, categoryId: $categoryId, companyName: $companyName, companyId: $companyId, reason: $reason)';
  }
}
