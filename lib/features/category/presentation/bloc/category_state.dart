part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoriesLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<CategoryEntity> categories;
  const CategoriesLoaded({
    required this.categories,
  });
  @override
  List<Object> get props => [categories];
}

class CategoriesListError extends CategoryState {
  final String message;
  const CategoriesListError({required this.message});

  @override
  List<Object> get props => [message];
}

class CategoryLoading extends CategoryState {}

class CategorySelected extends CategoryState {
  final CategoryEntity category;
  const CategorySelected({
    required this.category,
  });
  @override
  List<Object> get props => [category];
}

class CategoryLoadingError extends CategoryState {
  final String message;
  const CategoryLoadingError({required this.message});

  @override
  List<Object> get props => [message];
}
