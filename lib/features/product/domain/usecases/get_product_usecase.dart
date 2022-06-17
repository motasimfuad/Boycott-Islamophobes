import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/product_repository.dart';

class GetProductUsecase implements Usecase<ProductEntity, Params> {
  final ProductRepository repository;
  GetProductUsecase(this.repository);

  @override
  Future<Either<Failure, ProductEntity>> call(params) async {
    return await repository.getProduct(params.id!);
  }
}
