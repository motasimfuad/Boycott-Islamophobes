import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:boycott_islamophobes/features/category/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCategoriesUsecase extends Usecase<List<CategoryEntity>, NoParams> {
  final CategoryRepository repository;
  GetAllCategoriesUsecase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getAllCategories();
  }
}
