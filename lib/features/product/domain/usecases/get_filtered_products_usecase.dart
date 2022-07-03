import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetFilteredProductsUsecase
    implements Usecase<List<ProductEntity>, Params> {
  final ProductRepository productRepository;
  GetFilteredProductsUsecase(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(Params params) async {
    return await productRepository.getFilteredProducts(
      categoryId: params.id,
      countryId: params.id,
      searchText: params.searchText,
    );
  }
}
