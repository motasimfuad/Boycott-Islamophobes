import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, CategoryEntity>> getCategory(int categoryId);
}
