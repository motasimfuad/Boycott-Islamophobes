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
  final String? searchText;
  const GetFilteredProductsEvent({
    this.categoryId,
    this.searchText,
  });
}
