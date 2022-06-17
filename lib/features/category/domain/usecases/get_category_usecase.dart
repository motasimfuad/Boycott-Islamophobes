import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:boycott_islamophobes/features/category/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class GetCategoryUsecase implements Usecase<CategoryEntity, Params> {
  final CategoryRepository repository;
  GetCategoryUsecase(this.repository);

  @override
  Future<Either<Failure, CategoryEntity>> call(Params params) async {
    return await repository.getCategory(categoryId: params.id!);
  }
}
