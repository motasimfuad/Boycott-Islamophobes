import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_all_products_usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_filtered_products_usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUsecase getAllProducts;
  final GetProductUsecase getProduct;
  final GetFilteredProductsUsecase getFilteredProducts;
  ProductBloc({
    required this.getAllProducts,
    required this.getProduct,
    required this.getFilteredProducts,
  }) : super(ProductsInitial()) {
    on<ProductEvent>((event, emit) async {
      // get all products
      if (event is GetAllProductsEvent) {
        emit(ProductListLoading());
        final either = await getAllProducts(NoParams());
        either.fold(
          (failure) => emit(ProductListError(message: failure.toString())),
          (result) {
            emit(ProductListLoaded(products: result));
          },
        );
      }

      // get product
      if (event is GetProductEvent) {
        final either = await getProduct(Params(id: event.productId));
        either.fold(
          (failure) => emit(ProductLoadingError(message: failure.toString())),
          (result) {
            emit(ProductLoaded(product: result));
          },
        );
      }

      if (event is GetFilteredProductsEvent) {
        emit(FilteredProductListLoading());
        final either = await getFilteredProducts(Params(
          id: event.categoryId,
          searchText: event.searchText,
        ));
        either.fold(
          (failure) {
            emit(FilteredProductListError(message: failure.toString()));
          },
          (result) {
            emit(FilteredProductListLoaded(products: result));
          },
        );
      }
    });
  }
}
