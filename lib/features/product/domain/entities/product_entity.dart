import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String logoUrl;
  final String countryName;
  final int countryId;
  final String categoryName;
  final int categoryId;
  final String? companyName;
  final int? companyId;
  final String? reason;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.countryName,
    required this.countryId,
    required this.categoryName,
    required this.categoryId,
    this.companyName,
    this.companyId,
    this.reason,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        logoUrl,
        categoryName,
        categoryId,
        countryName,
        countryId,
        companyName,
        companyId,
        reason,
      ];
}
