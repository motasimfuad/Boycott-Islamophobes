import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:boycott_islamophobes/features/category/domain/usecases/get_all_categories_usecase.dart';
import 'package:boycott_islamophobes/features/category/domain/usecases/get_category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetAllCategoriesUsecase getAllCategories;
  GetCategoryUsecase getCategory;
  CategoryBloc({
    required this.getAllCategories,
    required this.getCategory,
  }) : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetAllCategoriesEvent) {
        emit(CategoriesLoading());
        final either = await getAllCategories(NoParams());
        either.fold(
          (failure) => emit(CategoriesListError(message: failure.toString())),
          (result) {
            emit(CategoriesLoaded(categories: result));
          },
        );
      }

      if (event is GetCategoryEvent) {
        emit(CategoryLoading());
        final either = await getCategory(Params(id: event.categoryId));
        either.fold(
          (failure) => emit(CategoryLoadingError(message: failure.toString())),
          (result) {
            emit(CategorySelected(category: result));
          },
        );
      }
    });
  }
}
