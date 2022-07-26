part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductsEvent extends ProductEvent {}

class GetProductEvent extends ProductEvent {
  final int productId;
  const GetProductEvent({required this.productId});
}

class GetFilteredProductsEvent extends ProductEvent {
  final int? categoryId;
  final int? countryId;
  final String? searchText;
  final ProductFilterType filterType;
  const GetFilteredProductsEvent({
    this.categoryId,
    this.countryId,
    this.searchText,
    required this.filterType,
  });
}

class DownloadProductCardEvent extends ProductEvent {
  final Widget productCard;
  final ProductEntity product;
  final ScreenshotController controller;
  const DownloadProductCardEvent({
    required this.productCard,
    required this.product,
    required this.controller,
  });
}
