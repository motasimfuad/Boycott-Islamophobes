import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/category/data/datasources/category_remote_data_source.dart';
import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/category/domain/repositories/category_repository.dart';
import 'package:dartz/dartz.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      var categories = await remoteDataSource.getAllCategories();
      return Right(categories);
    } on RemoteException catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategory(
      {required int categoryId}) async {
    try {
      var category = await remoteDataSource.getCategory(categoryId);
      return Right(category);
    } on RemoteException catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
