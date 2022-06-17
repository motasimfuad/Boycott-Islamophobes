import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/product/data/datasources/product_remote_data_source.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productDataSource;
  ProductRepositoryImpl(this.productDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final List<ProductEntity> products =
          await productDataSource.getAllProducts();
      return Right(products);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(int id) async {
    try {
      final ProductEntity product = await productDataSource.getProduct(id);
      return Right(product);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }
}
