import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String logoUrl;
  final int categoryId;
  final int countryId;
  final String? reason;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.categoryId,
    required this.countryId,
    this.reason,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        logoUrl,
        categoryId,
        countryId,
        reason,
      ];
}
