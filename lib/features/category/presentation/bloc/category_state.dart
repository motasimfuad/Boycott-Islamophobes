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
