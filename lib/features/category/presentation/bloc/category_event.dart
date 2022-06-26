part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesEvent extends CategoryEvent {}

class GetCategoryEvent extends CategoryEvent {
  final int categoryId;
  const GetCategoryEvent({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}
