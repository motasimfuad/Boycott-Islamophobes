import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/entities/product_entity.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_all_products_usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_filtered_products_usecase.dart';
import 'package:boycott_islamophobes/features/product/domain/usecases/get_product_usecase.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

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
        emit(ProductLoading());
        final either = await getProduct(Params(id: event.productId));
        either.fold(
          (failure) => emit(ProductLoadingError(message: failure.toString())),
          (result) {
            emit(ProductLoaded(product: result));
          },
        );
      }

      // get filtered products
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

      // download product card
      if (event is DownloadProductCardEvent) {
        emit(ProductCardDownloading());
        await Future.delayed(const Duration(seconds: 3));

        await event.controller
            .captureFromWidget(event.productCard)
            .then((capturedImage) async {
          await ImageGallerySaver.saveImage(
            capturedImage,
            name: "${event.product.name} - Boycott Islamophobes",
            quality: 100,
          );
        });

        print('ok');
        emit(ProductCardDownloaded(product: event.product));
      }
    });
  }
}
