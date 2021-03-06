part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductState {}

class ProductListLoading extends ProductState {}

class ProductListError extends ProductState {
  final String message;
  const ProductListError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductListLoaded extends ProductState {
  final List<ProductEntity> products;
  const ProductListLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductLoading extends ProductState {}

class ProductLoadingError extends ProductState {
  final String message;
  const ProductLoadingError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductLoaded extends ProductState {
  final ProductEntity product;
  const ProductLoaded({required this.product});

  @override
  List<Object> get props => [product];
}

class FilteredProductListLoading extends ProductState {}

class FilteredProductListError extends ProductState {
  final String message;
  const FilteredProductListError({required this.message});

  @override
  List<Object> get props => [message];
}

class FilteredProductListLoaded extends ProductState {
  final List<ProductEntity> products;
  const FilteredProductListLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductCardDownloading extends ProductState {}

class ProductCardDownloadError extends ProductState {
  final String message;
  const ProductCardDownloadError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductCardDownloaded extends ProductState {
  final ProductEntity product;
  const ProductCardDownloaded({required this.product});

  @override
  List<Object> get props => [product];
}
