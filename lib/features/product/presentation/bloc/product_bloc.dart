import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_all_products_usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductsUsecase getAllProducts;
  final GetProductUsecase getProduct;
  ProductBloc({
    required this.getAllProducts,
    required this.getProduct,
  }) : super(ProductsInitial()) {
    on<ProductEvent>((event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(ProductListLoading());
        final either = await getAllProducts(NoParams());
        either.fold(
          (failure) => emit(ProductListError(message: failure.toString())),
          (result) {
            print("Products: $result");
            emit(ProductListLoaded(products: result));
          },
        );
      }
    });
  }
}
