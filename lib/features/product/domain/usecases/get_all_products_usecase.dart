import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class GetAllProductsUsecase implements Usecase<List<ProductEntity>, NoParams> {
  final ProductRepository repository;
  GetAllProductsUsecase(this.repository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return repository.getAllProducts();
  }
}
