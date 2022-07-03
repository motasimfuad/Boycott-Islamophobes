import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, ProductEntity>> getProduct(int id);
  Future<Either<Failure, List<ProductEntity>>> getFilteredProducts({
    int? categoryId,
    int? countryId,
    String? searchText,
  });
}
